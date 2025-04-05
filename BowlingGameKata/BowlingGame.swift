public struct Roll {
    public let pins: Int
}

public protocol RollObserver: AnyObject {
    func didRoll(pins: Int)
}

public protocol RollNotifier {
    func addObserver(_ observer: RollObserver)
    func removeObserver(_ observer: RollObserver)
}

public class Frame: RollObserver {
    private let firstRoll: Roll
    private let rollNotifier: RollNotifier
    
    public init(firstRoll: Roll, rollNotifier: RollNotifier) {
        self.firstRoll = firstRoll
        self.rollNotifier = rollNotifier
        
        if isStrike {
            rollNotifier.addObserver(self)
        }
    }
    
    private var secondRoll: Roll?
    private var bonus = 0
    private var bonusCount = 0
    
    var score: Int {
        firstRoll.pins + (secondRoll?.pins ?? 0) + bonus
    }
    
    var isStrike: Bool { firstRoll.pins == 10 }
    
    var isSpare: Bool {
        guard let secondRoll = secondRoll else { return false }
        
        return firstRoll.pins + secondRoll.pins == 10
    }
    
    func canAddSecondRoll() -> Bool {
        !isStrike && secondRoll == nil
    }
    
    func addSecondRoll(_ roll: Roll) {
        secondRoll = roll
        
        if isSpare {
            rollNotifier.addObserver(self)
        }
    }
        
    public func didRoll(pins: Int) {
        guard canCollectBonus() else { return }
        
        bonus += pins
        bonusCount += 1

        if hasCollectedSpareBonus() || hasCollectedStrikeBonus() {
            rollNotifier.removeObserver(self)
        }
    }
    
    private func canCollectBonus() -> Bool {
        isSpare || isStrike
    }
    
    private func hasCollectedSpareBonus() -> Bool {
        isSpare && bonusCount == 1
    }
    
    private func hasCollectedStrikeBonus() -> Bool {
        isStrike && bonusCount == 2
    }
}

public class BowlingGame: RollNotifier {
    private var _frames: [Frame] = []
    private var _observers: [RollObserver] = []
    
    public init() {}

    public func roll(_ pins: Int) {
        guard let currentFrame = _frames.last else {
            addNewFrame(pins)
            return
        }
        
        notifyObservers(pins)

        if currentFrame.canAddSecondRoll() {
            currentFrame.addSecondRoll(.init(pins: pins))
        } else if _frames.count < 10 {
            addNewFrame(pins)
        } else {
            notifyObservers(pins)
        }
    }
    
    private func addNewFrame(_ pins: Int) {
        _frames.append(.init(firstRoll: .init(pins: pins), rollNotifier: self))
    }
    
    public func score() -> Int {
        _frames.reduce(0) { $0 + $1.score }
    }
    
    private func notifyObservers(_ pins: Int) {
        _observers.forEach { $0.didRoll(pins: pins) }
    }
    
    public func addObserver(_ observer: any RollObserver) {
        _observers.append(observer)
    }
    
    public func removeObserver(_ observer: any RollObserver) {
        _observers.removeAll { $0 === observer }
    }
}
