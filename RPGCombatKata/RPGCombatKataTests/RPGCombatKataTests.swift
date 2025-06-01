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
    func cannotDealDamageToItself() {
        let sut = makeCharacter()
        
        sut.dealDamage(to: sut, amount: 500)
        
        #expect(sut.getHealth() == 1000)
        #expect(sut.getState() == .alive)
    }
    
    @Test
    func character_canHealThemself() {
        let sut = makeCharacter()
        
        sut.heal(amount: 500)
        
        #expect(sut.getHealth() == 1500)
    }
    
    @Test
    func deadCharacter_cannotHeal() {
        let sut = makeDeadCharacter()
        
        sut.heal(amount: 500)
        
        #expect(sut.getHealth() == 0)
    }
    
    // MARK: - Helpers
    
    private func makeCharacter(health: Int = 1000) -> Character {
        Character(health: health)
    }
    
    private func makeDeadCharacter() -> Character {
        Character(health: 0)
    }

}
