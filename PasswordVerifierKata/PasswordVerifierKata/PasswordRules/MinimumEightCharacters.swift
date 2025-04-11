public class MinimumEightCharacters: PasswordRule {
    public struct LessThanEightCharacters: Error {}

    public func verify(_ password: String) throws {
        guard password.count >= 8 else {
            throw LessThanEightCharacters()
        }
    }
}
