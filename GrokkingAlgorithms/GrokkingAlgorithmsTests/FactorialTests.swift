import Testing
import GrokkingAlgorithms

struct FactorialTests {
    
    @Test
    func factorial_1() {
        #expect(compute(1) == 1)
    }
    
    @Test
    func factorial_2() {
        #expect(compute(2) == 2)
    }
    
    @Test
    func factorial_3() {
        #expect(compute(3) == 6)
    }
    
    @Test
    func factorial_4() {
        #expect(compute(4) == 24)
    }
    
    @Test
    func factorial_5() {
        #expect(compute(5) == 120)
    }
    
    // MARK: - Helpers
    
    private func compute(_ number: Int) -> Int {
        Factorial().compute(number)
    }
}
