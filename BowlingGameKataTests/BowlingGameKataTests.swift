import Testing

public class BowlingGame {
    private var _score = 0

    public func roll(_ pins: Int) {
        _score += pins
    }
    
    public func score() -> Int {
        _score
    }
}

struct BowlingGameKataTests {

    @Test
    func gutterGame() {
        let sut = BowlingGame()
        
        for _ in 0..<20 {
            sut.roll(0)
        }
        
        #expect(sut.score() == 0)
    }
    
    @Test
    func roll_withoutBonus() {
        let sut = BowlingGame()
        
        sut.roll(5)
        sut.roll(3)
        
        #expect(sut.score() == 8)

    }

}
