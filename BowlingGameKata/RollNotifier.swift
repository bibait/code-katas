public protocol RollNotifier {
    func addObserver(_ observer: RollObserver)
    func removeObserver(_ observer: RollObserver)
}
