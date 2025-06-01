public class Character {
    private var health: Int
    
    public init(health: Int = 1000) {
        self.health = health
    }
    
    public enum State {
        case alive, dead
    }
    
    public func heal(amount: Int) {
        guard getState() == .alive else { return }

        health += amount
    }
    
    public func dealDamage(to other: Character, amount: Int) {
        guard other !== self else { return }

        other.health = max(0, other.health - amount)
    }
    
    public func getState() -> State {
        health <= 0 ? .dead : .alive
    }
    
    public func getHealth() -> Int {
        health
    }
    
    public func getLevel() -> Int {
        1
    }
}
