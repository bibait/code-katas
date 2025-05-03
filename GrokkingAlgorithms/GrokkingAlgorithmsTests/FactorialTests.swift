import Testing
import GrokkingAlgorithms

struct FactorialTests {
    
    @Test(arguments: [
        (1, 1),
        (2, 2),
        (3, 6),
        (4, 24),
        (5, 120),
    ])
    func factorial(number: Int, expected: Int) {
        #expect(compute(number) == expected)
    }
    
    // MARK: - Helpers
    
    private func compute(_ number: Int) -> Int {
        Factorial.compute(number)
    }
}
