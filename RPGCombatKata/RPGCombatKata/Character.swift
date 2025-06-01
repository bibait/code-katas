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
    
    private var maxHealth:  Int {
        level < 6 ? 1000 : 1500
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
        
        if abs(other.getLevel() - level) >= 5 {
            other.health = max(0, other.health - amount / 2)
        } else {
            other.health = max(0, other.health - amount)
        }
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
