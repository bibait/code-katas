import Testing

class Character {
    private(set) var health: Int
    
    init(health: Int = 1000) {
        self.health = health
    }
    
    enum State {
        case alive, dead
    }
    
    func dealDamage(to other: Character, amount: Int) {
        other.health = max(0, other.health - amount)
    }
    
    func getState() -> State {
        health <= 0 ? .dead : .alive
    }
}

struct RPGCombatKataTests {

    @Test
    func initialValues() {
        let sut = Character()
        
        #expect(sut.health == 1000)
        #expect(sut.getState() == .alive)
    }
    
    @Test
    func dealDamageToOtherCharacter() {
        let otherCharacter = Character()
        let sut = Character()
        
        sut.dealDamage(to: otherCharacter, amount: 100)
        
        #expect(otherCharacter.health == 900)
    }
    
    @Test
    func dealDamageToOtherCharacter_killsOtherCharacter() {
        let otherCharacter = Character(health: 100)
        let sut = Character()
        
        sut.dealDamage(to: otherCharacter, amount: 110)
        
        #expect(otherCharacter.health == 0)
        #expect(otherCharacter.getState() == .dead)
    }

}
