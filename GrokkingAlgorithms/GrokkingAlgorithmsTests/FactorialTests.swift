import Testing
import GrokkingAlgorithms

struct FactorialTests {
    
    func factorial_0() {
        let result = factorial(0)
        
        #expect(result == 0)
    }
    
    func factorial_1() {
        let result = factorial(1)
        
        #expect(result == 1)
    }
    
    func factorial_2() {
        let result = factorial(2)
        
        #expect(result == 2)
    }
    
    func factorial_3() {
        let result = factorial(3)
        
        #expect(result == 6)
    }
    
    func factorial_4() {
        let result = factorial(4)
        
        #expect(result == 24)
    }
    
    func factorial_5() {
        let result = factorial(4)
        
        #expect(result == 120)
    }
    
}
