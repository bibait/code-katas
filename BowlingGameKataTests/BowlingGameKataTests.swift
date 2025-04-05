import Testing

struct Roll {
    let pins: Int
}

protocol FrameObserver: AnyObject {
    func didRoll(pins: Int)
}

protocol FrameObserverConnector {
    func addObserver(_ observer: FrameObserver)
    func removeObserver(_ observer: FrameObserver)
}

class Frame: FrameObserver {
    private let firstRoll: Roll
    private let frameObserverConnector: FrameObserverConnector
    
    init(firstRoll: Roll, frameObserverConnector: FrameObserverConnector) {
        self.firstRoll = firstRoll
        self.frameObserverConnector = frameObserverConnector
        
        if isStrike {
            frameObserverConnector.addObserver(self)
        }
    }
    
    private var secondRoll: Roll?
    private var bonus = 0
    private var bonusCount = 0
    
    var score: Int {
        firstRoll.pins + (secondRoll?.pins ?? 0) + bonus
    }
    
    var isStrike: Bool {
        firstRoll.pins == 10
    }
    
    var isSpare: Bool {
        firstRoll.pins + (secondRoll?.pins ?? -1) == 10
    }
    
    func canAddSecondRoll() -> Bool {
        !isStrike && secondRoll == nil
    }
    
    func addSecondRoll(_ roll: Roll) {
        secondRoll = roll
        
        if isSpare {
            frameObserverConnector.addObserver(self)
        }
    }
        
    func didRoll(pins: Int) {
        if isSpare || isStrike {
            bonus += pins
            bonusCount += 1
        }

        if isSpare && bonusCount == 1 || isStrike && bonusCount == 2 {
            frameObserverConnector.removeObserver(self)
        }
    }
}

public class BowlingGame: FrameObserverConnector {
    private var _frames: [Frame] = []
    private var _observers: [FrameObserver] = []

    public func roll(_ pins: Int) {
        guard let lastFrame = _frames.last else {
            _frames.append(.init(firstRoll: .init(pins: pins), frameObserverConnector: self))
            return
        }
        
        notifyObservers(pins)

        if lastFrame.canAddSecondRoll() {
            lastFrame.addSecondRoll(.init(pins: pins))
        } else {
            _frames.append(.init(firstRoll: .init(pins: pins), frameObserverConnector: self))
        }
    }
    
    public func score() -> Int {
        _frames.reduce(0) { $0 + $1.score }
    }
    
    private func notifyObservers(_ pins: Int) {
        _observers.forEach { $0.didRoll(pins: pins) }
    }
    
    func addObserver(_ observer: any FrameObserver) {
        _observers.append(observer)
    }
    
    func removeObserver(_ observer: any FrameObserver) {
        _observers.removeAll { $0 === observer }
    }
}

struct BowlingGameKataTests {

    @Test
    func gutterGame() {
        let sut = makeSUT()
        
        gutterGame(sut: sut)
        
        #expect(sut.score() == 0)
    }
    
    @Test
    func game_withoutBonus() {
        let sut = makeSUT()
        
        sut.roll(5)
        sut.roll(3)
        sut.roll(2)
        sut.roll(4)
        sut.roll(1)
        sut.roll(0)
        roll(pins: 0, times: 14, sut: sut)
        
        #expect(sut.score() == 15)
    }
    
    @Test
    func roll_withSpare() {
        let sut = makeSUT()

        rollSpare(sut: sut)
        sut.roll(3)
        sut.roll(2)
        
        #expect(sut.score() == 18)
    }
    
    @Test
    func roll_withStrike() {
        let sut = makeSUT()

        rollStrike(sut: sut)
        sut.roll(3)
        sut.roll(2)
        
        #expect(sut.score() == 20)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> BowlingGame {
        let sut = BowlingGame()
        
        return sut
    }
    
    private func gutterGame(sut: BowlingGame) {
        roll(pins: 0, times: 20, sut: sut)
    }
    
    private func rollStrike(sut: BowlingGame) {
        sut.roll(10)
    }
    
    private func rollSpare(sut: BowlingGame) {
        sut.roll(5)
        sut.roll(5)
    }
    
    private func roll(pins: Int, times: Int, sut: BowlingGame) {
        for _ in 0..<times {
            sut.roll(pins)
        }
    }

}
