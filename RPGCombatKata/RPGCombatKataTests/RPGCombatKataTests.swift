import Testing
import RPGCombatKata

struct RPGCombatKataTests {
    
    private let faction = Faction(name: "Faction")
    private let otherFaction = Faction(name: "Other Faction")

    @Test
    func initialValues() {
        let sut = Character()
        
        #expect(sut.getHealth() == 1000)
        #expect(sut.getState() == .alive)
        #expect(sut.getLevel() == 1)
        #expect(sut.getFactions().isEmpty)
    }
    
    @Test
    func dealDamageToOtherCharacter() {
        let defender = makeCharacter()
        let attacker = makeCharacter()
        
        attacker.dealDamage(damage: 100, to: defender)
        
        #expect(defender.getHealth() == 900)
    }
    
    @Test
    func dealDamageToOtherCharacter_killsOtherCharacter() {
        let defender = makeCharacter(health: 100)
        let attacker = makeCharacter()
        
        attacker.dealDamage(damage: 110, to: defender)
        
        #expect(defender.getHealth() == 0)
        #expect(defender.getState() == .dead)
    }
    
    @Test
    func dealDamage_withTarget5OrMoveLevelsBelow_increasesDamageBy50Percent() {
        let defender = makeCharacter(level: 5)
        let attacker = makeCharacter(level: 10)
        
        attacker.dealDamage(damage: 100, to: defender)
        
        #expect(defender.getHealth() == 850)
    }
    
    @Test
    func dealDamage_withTarget5OrMoveLevelsAbove_reducesDamageBy50Percent() {
        let defender = makeCharacter(level: 10)
        let attacker = makeCharacter(level: 5)
        
        attacker.dealDamage(damage: 100, to: defender)
        
        #expect(defender.getHealth() == 950)
    }
    
    @Test
    func cannotDealDamageToItself() {
        let sut = makeCharacter()
        
        sut.dealDamage(damage: 500, to: sut)
        
        #expect(sut.getHealth() == 1000)
        #expect(sut.getState() == .alive)
    }
    
    @Test
    func cannotDealDamageToAlly() {
        let ally = makeCharacter()
        let attacker = makeCharacter()
        
        ally.joinFaction(faction)
        attacker.joinFaction(faction)
        
        attacker.dealDamage(damage: 500, to: ally)
        
        #expect(ally.getHealth() == 1000)
    }
    
    @Test
    func character_canHealThemself() {
        let sut = makeCharacter(health: 100)
        
        sut.heal(amount: 500)
        
        #expect(sut.getHealth() == 600)
    }
    
    @Test
    func deadCharacter_cannotHeal() {
        let sut = makeDeadCharacter()
        
        sut.heal(amount: 500)
        
        #expect(sut.getHealth() == 0)
    }
    
    @Test
    func maxHealthBelowLevelSix_is1000() {
        let sut = makeCharacter(health: 1000, level: 5)
        
        sut.heal(amount: 500)
        
        #expect(sut.getHealth() == 1000)
    }
    
    @Test
    func maxHealthAboveLevelSix_is1500() {
        let sut = makeCharacter(health: 1000, level: 6)
        
        sut.heal(amount: 600)
        
        #expect(sut.getHealth() == 1500)
    }
    
    @Test
    func joinFaction() {
        let sut = makeCharacter()
        
        sut.joinFaction(faction)
        sut.joinFaction(otherFaction)
        sut.joinFaction(faction)
        
        #expect(sut.getFactions() == [faction, otherFaction])
    }
    
    @Test
    func leaveFaction() {
        let sut = makeCharacter()
        
        sut.joinFaction(faction)
        sut.leaveFaction(faction)
        
        #expect(sut.getFactions().isEmpty)
    }
    
    // MARK: - Helpers
    
    private func makeCharacter(
        health: Int = 1000,
        level: Int = 1
    ) -> Character {
        Character(health: health, level: level)
    }
    
    private func makeDeadCharacter() -> Character {
        Character(health: 0)
    }

}
