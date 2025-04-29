public class Factorial {
    public static func compute(_ number: Int) -> Int {
        number == 1 ? 1 : number * compute(number - 1)
    }
}

public func factorial(_ n: Int) -> Int {
    n == 1 ? 1 : n * factorial(n - 1)
}
