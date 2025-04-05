import Testing

public class BowlingGame {
    public func roll(_ pins: Int) {
    }
    
    public func score() -> Int {
        0
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

}
