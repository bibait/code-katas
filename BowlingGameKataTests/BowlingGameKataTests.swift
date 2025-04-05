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
        let sut = makeSUT()
        
        for _ in 0..<20 {
            sut.roll(0)
        }
        
        #expect(sut.score() == 0)
    }
    
    @Test
    func roll_withoutBonus() {
        let sut = makeSUT()
        
        sut.roll(5)
        sut.roll(3)
        
        #expect(sut.score() == 8)
    }
    
    @Test
    func game_withoutBonus() {
        let sut = makeSUT()
        
        sut.roll(5)
        sut.roll(3)
        sut.roll(2)
        sut.roll(4)
        sut.roll(1)
        sut.roll(0)
        for _ in 0..<14 {
            sut.roll(0)
        }
        
        #expect(sut.score() == 15)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> BowlingGame {
        let sut = BowlingGame()
        
        return sut
    }

}
