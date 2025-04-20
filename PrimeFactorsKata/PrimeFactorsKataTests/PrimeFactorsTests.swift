import Testing
import PrimeFactorsKata

public class PrimeFactors {
    public static func generate(_ number: Int) -> [Int] {
        var result = [Int]()

        if number > 1 {
            result.append(contentsOf: [number])
        }
        
        return result
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
    
    @Test
    func generate_3() {
        let result = PrimeFactors.generate(3)
        
        #expect(result == [3])
    }

}
