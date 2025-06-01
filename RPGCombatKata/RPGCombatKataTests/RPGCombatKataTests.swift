import Testing

struct Character {
    let health: Int
    let state: State
    
    init() {
        health = 1000
        state = .alive
    }
    
    enum State {
        case alive, dead
    }
}

struct RPGCombatKataTests {

    @Test
    func initialValues() {
        let sut = Character()
        
        #expect(sut.health == 1000)
        #expect(sut.state == .alive)
    }

}
