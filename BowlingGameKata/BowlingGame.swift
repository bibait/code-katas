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
