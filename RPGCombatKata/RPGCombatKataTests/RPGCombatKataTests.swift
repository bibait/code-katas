import Testing

class Character {
    private(set) var health: Int
    private(set) var state: State
    
    init() {
        health = 1000
        state = .alive
    }
    
    enum State {
        case alive, dead
    }
    
    func dealDamage(to other: Character, amount: Int) {
        other.health -= amount
    }
}

struct RPGCombatKataTests {

    @Test
    func initialValues() {
        let sut = Character()
        
        #expect(sut.health == 1000)
        #expect(sut.state == .alive)
    }
    
    @Test
    func dealDamageToOtherCharacter() {
        let otherCharacter = Character()
        let sut = Character()
        
        sut.dealDamage(to: otherCharacter, amount: 100)
        
        #expect(otherCharacter.health == 900)
    }

}
