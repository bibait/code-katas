public class MinimumEightCharacters: PasswordRule {
    public struct LessThanEightCharacters: Error {}
    
    public var error: Error {
        LessThanEightCharacters()
    }

    public func isValid(_ password: String) -> Bool {
        password.count >= 8
    }
}
