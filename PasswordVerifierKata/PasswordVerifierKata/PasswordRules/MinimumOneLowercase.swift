public class MinimumOneLowercase: PasswordRule {
    public struct NoLowercase: Error {}

    public func verify(_ password: String) throws {
        guard hasLowercaseLetter(password) else {
            throw NoLowercase()
        }
    }
    
    private func hasLowercaseLetter(_ input: String) -> Bool {
        for char in input {
            if char.isLowercase {
                return true
            }
        }
        
        return false
    }
}
