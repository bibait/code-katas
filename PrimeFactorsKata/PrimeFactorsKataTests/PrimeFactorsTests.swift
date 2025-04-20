import Testing
import PrimeFactorsKata

public class PrimeFactors {
    public static func generate(_ number: Int) -> [Int] {
        []
    }
}

struct PrimeFactorsTests {

    @Test
    func generate_1() {
        let result = PrimeFactors.generate(1)
        
        #expect(result.isEmpty)
    }

}
