import Testing
import PrimeFactorsKata

public class PrimeFactors {
    public static func generate(_ number: Int) -> [Int] {
        var result = [Int]()
        var number = number

        if number > 1 {
            if number % 2 == 0 {
                result.append(2)
                number /= 2
            }

            if number > 1 {
                result.append(contentsOf: [number])
            }
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

}
