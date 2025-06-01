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
        health: Int = Character.INITIAL_HEALTH,
        level: Int = Character.INITIAL_LEVEL,
        factions: [Faction] = Character.INITIAL_FACTIONS
    ) {
        self.health = health
        self.level = level
        self.factions = factions
    }
    
    public static let INITIAL_HEALTH = 1000
    public static let INITIAL_LEVEL = 1
    public static let INITIAL_FACTIONS: [Faction] = []
    
    public static let HEALTH_LEVEL_THRESHOLD = 6
    public static let MAX_HEALTH = 1500
    
    public static let DAMAGE_PERCENTAGE = 50
    public static let DECREASE_DAMAGE_LEVEL_DIFFERENCE = 5
    public static let INCREASE_DAMAGE_LEVEL_DIFFERENCE = -5

    private var maxHealth: Int {
        level < Character.HEALTH_LEVEL_THRESHOLD ? Character.INITIAL_HEALTH : Character.MAX_HEALTH
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
        
        let damageAmount = calculateDamageAmount(amount: damage, to: other)

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
        amount: Int,
        to other: Character
    ) -> Int {
        let levelDifference = other.getLevel() - level
        
        if levelDifference >= Character.DECREASE_DAMAGE_LEVEL_DIFFERENCE {
            return amount.decreased(byPercentage: Character.DAMAGE_PERCENTAGE)
        } else if levelDifference <= Character.INCREASE_DAMAGE_LEVEL_DIFFERENCE {
            return amount.increased(byPercentage: Character.DAMAGE_PERCENTAGE)
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
