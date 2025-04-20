import Testing
import PrimeFactorsKata

struct PrimeFactorsTests {

    @Test
    func generate_1() {
        let result = PrimeFactors.generate(1)
        
        #expect(result.isEmpty)
    }
    
    @Test(arguments: [2, 3])
    func generate_sameNumber(number: Int) {
        let result = PrimeFactors.generate(number)
        
        #expect(result == [number])
    }
    
    @Test
    func generate_4() {
        let result = PrimeFactors.generate(4)
        
        #expect(result == [2, 2])
    }
    
    @Test
    func generate_6() {
        let result = PrimeFactors.generate(6)
        
        #expect(result == [2, 3])
    }
    
    @Test
    func generate_8() {
        let result = PrimeFactors.generate(8)
        
        #expect(result == [2, 2, 2])
    }
    
    @Test
    func generate_9() {
        let result = PrimeFactors.generate(9)
        
        #expect(result == [3, 3])
    }

}
