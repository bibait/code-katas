public struct Faction: Equatable {
    let name: String
    
    public init(name: String) {
        self.name = name
    }
}

public class Character {
    private var health: Int
    private var level: Int
    private var factions: [Faction]
    
    public init(
        health: Int = 1000,
        level: Int = 1,
        factions: [Faction] = []
    ) {
        self.health = health
        self.level = level
        self.factions = factions
    }
    
    private var maxHealth: Int {
        level < 6 ? 1000 : 1500
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
    
    public func getFactions() -> [Faction] {
        factions
    }
    
    public enum State {
        case alive, dead
    }
    
    public func heal(amount: Int) {
        guard getState() == .alive else { return }

        health = min(health + amount, maxHealth)
    }
    
    public func healAlly(amount: Int, ally: Character) {
        guard isInSameFaction(as: ally) else { return }
        
        ally.heal(amount: amount)
    }
    
    public func dealDamage(damage: Int, to other: Character) {
        guard canDealDamage(to: other) else { return }
        
        let damageAmount = calculateDamageAmount(other, amount: damage)

        other.health = max(0, other.health - damageAmount)
    }
    
    private func canDealDamage(to other: Character) -> Bool {
        other !== self && !isInSameFaction(as: other)
    }
    
    private func isInSameFaction(as other: Character) -> Bool {
        for faction in factions {
            for otherFaction in other.factions {
                if faction == otherFaction {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func calculateDamageAmount(
        _ other: Character,
        amount: Int
    ) -> Int {
        let levelDifference = other.getLevel() - level
        
        if levelDifference >= 5 {
            return amount.decreased(byPercentage: 50)
        } else if levelDifference <= -5 {
            return amount.increased(byPercentage: 50)
        }
        
        return amount
    }
    
    public func joinFaction(_ faction: Faction) {
        guard !factions.contains(faction) else { return }

        factions.append(faction)
    }
    
    public func leaveFaction(_ faction: Faction) {
        factions.removeAll { $0 == faction }
    }
}
