import Testing
import GrokkingAlgorithms

struct FactorialTests {
    
    func factorials() {
        #expect(compute(0) == 0)
        #expect(compute(1) == 1)
        #expect(compute(2) == 2)
        #expect(compute(3) == 6)
        #expect(compute(4) == 24)
        #expect(compute(5) == 120)
    }
    
    // MARK: - Helpers
    
    private func compute(_ number: Int) -> Int {
        factorial(number)
    }
}
