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
        
    public func didRoll(_ roll: Roll) {
        guard canCollectBonus() else { return }
        
        bonus += roll.pins
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
