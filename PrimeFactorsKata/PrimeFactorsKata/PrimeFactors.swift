public class PrimeFactors {
    public static func generate(_ number: Int) -> [Int] {
        var result = [Int]()
        var number = number

        var candidate = 2

        while number > 1 {
            while number % candidate == 0 {
                result.append(candidate)
                number /= candidate
            }
            candidate += 1
        }
        
        return result
    }
}
