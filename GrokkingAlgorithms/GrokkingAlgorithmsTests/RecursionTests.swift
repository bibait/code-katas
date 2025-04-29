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
    
}
