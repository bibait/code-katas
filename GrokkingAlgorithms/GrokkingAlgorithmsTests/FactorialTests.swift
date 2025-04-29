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
    
    func factorial_1() {
        #expect(compute(1) == 1)
    }
    
    func factorial_2() {
        #expect(compute(2) == 2)
    }
    
    func factorial_3() {
        #expect(compute(3) == 6)
    }
    
    func factorial_4() {
        #expect(compute(4) == 24)
    }
    
    func factorial_5() {
        #expect(compute(5) == 120)
    }
    
    // MARK: - Helpers
    
    private func compute(_ number: Int) -> Int {
        factorial(number)
    }
}
