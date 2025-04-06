public class BowlingGame: RollNotifier {
    private var _frames: [Frame] = []
    private var _observers: [RollObserver] = []
    
    public init() {}
    
    private let maxNumberOfFrames = 10

    public func roll(_ pins: Int) {
        guard let currentFrame = _frames.last else {
            addNewFrame(pins)
            return
        }
        
        notifyObservers(pins)

        if currentFrame.canAddSecondRoll() {
            currentFrame.addSecondRoll(.init(pins: pins))
        } else if !hasReachedLastFrame() {
            addNewFrame(pins)
        } else {
            notifyObservers(pins)
        }
    }
    
    private func hasReachedLastFrame() -> Bool {
        _frames.count == maxNumberOfFrames
    }
    
    private func addNewFrame(_ pins: Int) {
        _frames.append(.init(firstRoll: .init(pins: pins), rollNotifier: self))
    }
    
    public func score() -> Int {
        _frames.reduce(0) { $0 + $1.score }
    }
    
    private func notifyObservers(_ pins: Int) {
        _observers.forEach { $0.didRoll(.init(pins: pins)) }
    }
    
    public func addObserver(_ observer: any RollObserver) {
        _observers.append(observer)
    }
    
    public func removeObserver(_ observer: any RollObserver) {
        _observers.removeAll { $0 === observer }
    }
}
