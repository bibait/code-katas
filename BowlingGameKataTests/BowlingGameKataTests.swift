import Testing

public class BowlingGame {
    private var _rolls: [Int] = []

    public func roll(_ pins: Int) {
        _rolls.append(pins)
    }
    
    public func score() -> Int {
        var result = 0
        
        var frameIndex = 0
        
        for _ in 0..<_rolls.count {
            if frameIndex + 2 <= _rolls.count {
                if _rolls[frameIndex] == 10 {
                    result += 10 + _rolls[frameIndex+1] + _rolls[frameIndex+2]
                    frameIndex += 1
                } else if _rolls[frameIndex] + _rolls[frameIndex+1] == 10 {
                    result += 10 + _rolls[frameIndex+2]
                    frameIndex += 2
                } else {
                    result += _rolls[frameIndex]
                    frameIndex += 1
                }
            } else if frameIndex + 1 <= _rolls.count{
                result += _rolls[frameIndex]
                frameIndex += 1
            }
        }

        return result
    }
}

struct BowlingGameKataTests {

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

        sut.roll(10)
        sut.roll(3)
        sut.roll(2)
        
        #expect(sut.score() == 20)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> BowlingGame {
        let sut = BowlingGame()
        
        return sut
    }
    
    private func gutterGame(sut: BowlingGame) {
        roll(pins: 0, times: 20, sut: sut)
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
