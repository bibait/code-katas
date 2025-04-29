import Testing
import GrokkingAlgorithms

func factorial(_ n: Int) -> Int {
    n
}

struct RecursionTests {
    
    @Test
    func factorial_zero_shouldReturnZero() {
        let result = factorial(0)
        
        #expect(result == 0)
    }
    
    @Test
    func factorial_one_shouldReturnOne() {
        let result = factorial(1)
        
        #expect(result == 1)
    }
    
}
