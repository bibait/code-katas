public class MinimumOneLowercase: PasswordRule {
    public struct NoLowercase: Error {}

    public var error: Error {
        NoLowercase()
    }
    
    public func isValid(_ password: String) -> Bool {
        hasLowercaseLetter(password)
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
