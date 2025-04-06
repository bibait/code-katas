import Testing
import BowlingGameKata

struct BowlingGameTests {

    @Test
    func gutterGame() {
        let sut = makeSUT()
        
        gutterGame(sut: sut)
        
        #expect(sut.score() == 0)
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
        roll(pins: 0, times: 14, sut: sut)
        
        #expect(sut.score() == 15)
    }
    
    @Test
    func roll_withSpare() {
        let sut = makeSUT()

        rollSpare(sut: sut)
        sut.roll(3)
        sut.roll(2)
        
        #expect(sut.score() == 18)
    }
    
    @Test
    func roll_withStrike() {
        let sut = makeSUT()

        rollStrike(sut: sut)
        sut.roll(3)
        sut.roll(2)
        
        #expect(sut.score() == 20)
    }
    
    @Test
    func perfectGame() {
        let sut = makeSUT()

        roll(pins: 10, times: 12, sut: sut)
        
        #expect(sut.score() == 300)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> BowlingGame {
        let sut = BowlingGame()
        
        return sut
    }
    
    private func gutterGame(sut: BowlingGame) {
        roll(pins: 0, times: 20, sut: sut)
    }
    
    private func rollStrike(sut: BowlingGame) {
        sut.roll(10)
    }
    
    private func rollSpare(sut: BowlingGame) {
        sut.roll(5)
        sut.roll(5)
    }
    
    private func roll(pins: Int, times: Int, sut: BowlingGame) {
        for _ in 0..<times {
            sut.roll(pins)
        }
    }

}
