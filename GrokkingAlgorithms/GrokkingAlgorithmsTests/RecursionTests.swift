import Testing
import GrokkingAlgorithms

func factorial(_ n: Int) -> Int {
    n
}

struct RecursionTests {
    
    @Test(arguments: [
        (0, 0),
        (1, 1),
        (2, 2),
    ])
    func factorial_n(n: Int, expected: Int) {
        let result = factorial(n)
        
        #expect(result == expected)
    }

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
    
    @Test
    func factorial_two_shouldReturnTwo() {
        let result = factorial(2)
        
        #expect(result == 2)
    }
    
}
