public class Character {
    private var health: Int
    private var level: Int
    
    public init(
        health: Int = 1000,
        level: Int = 1
    ) {
        self.health = health
        self.level = level
    }
    
    private var maxHealth: Int {
        level < 6 ? 1000 : 1500
    }
    
    private func calculateDamageAmount(
        _ other: Character,
        amount: Int
    ) -> Int {
        let levelDifference = other.getLevel() - level
        
        if levelDifference >= 5 {
            return amount.decreaseBy(percentage: 50)
        } else if levelDifference <= -5 {
            return amount.increaseBy(percentage: 50)
        }
        
        return amount
    }
    
    public enum State {
        case alive, dead
    }
    
    public func heal(amount: Int) {
        guard getState() == .alive else { return }

        health = min(health + amount, maxHealth)
    }
    
    public func dealDamage(to other: Character, amount: Int) {
        guard other !== self else { return }
        
        let damage = calculateDamageAmount(other, amount: amount)

        other.health = max(0, other.health - damage)
    }
    
    public func getState() -> State {
        health <= 0 ? .dead : .alive
    }
    
    public func getHealth() -> Int {
        health
    }
    
    public func getLevel() -> Int {
        level
    }
}

extension Int {
    func increaseBy(percentage: Int) -> Int {
        self + (self * percentage / 100)
    }
    
    func decreaseBy(percentage: Int) -> Int {
        self - (self * percentage / 100)
    }
}
