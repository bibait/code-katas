public class Factorial {
    public static func compute(_ number: Int) -> Int {
        number == 1 ? 1 : number * compute(number - 1)
    }
}
