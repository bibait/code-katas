public struct Faction: Equatable, Hashable {
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
        health: Int = Character.startHealth,
        level: Int = Character.startLevel,
        factions: [Faction] = Character.startFactions
    ) {
        self.health = health
        self.level = level
        self.factions = factions
    }
    
    public static let startHealth = 1000
    public static let startLevel = 1
    public static let startFactions: [Faction] = []
    
    public static let healthLevelThreshold = 6
    public static let maxHealth = 1500
    
    public static let damagePercentage = 50
    public static let decreaseDamageLevelDifference = 5
    public static let increaseDamageLevelDifference = -5

    private var maxHealth: Int {
        level < Character.healthLevelThreshold ? Character.startHealth : Character.maxHealth
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
        !Set(factions).isDisjoint(with: Set(other.factions))
    }
    
    private func calculateDamageAmount(
        amount: Int,
        to other: Character
    ) -> Int {
        let levelDifference = other.getLevel() - level
        
        if levelDifference >= Character.decreaseDamageLevelDifference {
            return amount.decreased(byPercentage: Character.damagePercentage)
        } else if levelDifference <= Character.increaseDamageLevelDifference {
            return amount.increased(byPercentage: Character.damagePercentage)
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
