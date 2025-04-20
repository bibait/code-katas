import Testing
import PrimeFactorsKata

public class PrimeFactors {
    public static func generate(_ number: Int) -> [Int] {
        if number == 1 {
            return []
        }
        
        return [number]
    }
}

struct PrimeFactorsTests {

    @Test
    func generate_1() {
        let result = PrimeFactors.generate(1)
        
        #expect(result.isEmpty)
    }
    
    @Test
    func generate_2() {
        let result = PrimeFactors.generate(2)
        
        #expect(result == [2])
    }

}
