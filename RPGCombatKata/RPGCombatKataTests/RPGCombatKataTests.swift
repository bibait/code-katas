import Testing
import RPGCombatKata

struct RPGCombatKataTests {

    @Test
    func initialValues() {
        let sut = Character()
        
        #expect(sut.getHealth() == 1000)
        #expect(sut.getState() == .alive)
        #expect(sut.getLevel() == 1)
    }
    
    @Test
    func dealDamageToOtherCharacter() {
        let otherCharacter = makeCharacter()
        let sut = makeCharacter()
        
        sut.dealDamage(to: otherCharacter, amount: 100)
        
        #expect(otherCharacter.getHealth() == 900)
    }
    
    @Test
    func dealDamageToOtherCharacter_killsOtherCharacter() {
        let otherCharacter = makeCharacter(health: 100)
        let sut = makeCharacter()
        
        sut.dealDamage(to: otherCharacter, amount: 110)
        
        #expect(otherCharacter.getHealth() == 0)
        #expect(otherCharacter.getState() == .dead)
    }
    
    @Test
    func dealDamage_withTarget5OrMoveLevelsBelow_increasesDamageBy50Percent() {
        let otherCharacter = makeCharacter(level: 5)
        let sut = makeCharacter(level: 10)
        
        sut.dealDamage(to: otherCharacter, amount: 100)
        
        #expect(otherCharacter.getHealth() == 850)
    }
    
    @Test
    func dealDamage_withTarget5OrMoveLevelsAbove_reducesDamageBy50Percent() {
        let otherCharacter = makeCharacter(level: 10)
        let sut = makeCharacter(level: 5)
        
        sut.dealDamage(to: otherCharacter, amount: 100)
        
        #expect(otherCharacter.getHealth() == 950)
    }
    
    @Test
    func cannotDealDamageToItself() {
        let sut = makeCharacter()
        
        sut.dealDamage(to: sut, amount: 500)
        
        #expect(sut.getHealth() == 1000)
        #expect(sut.getState() == .alive)
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
