public class MinimumOneUppercase: PasswordRule {
    public struct NoUppercase: Error {}

    public var error: Error {
        NoUppercase()
    }
    
    public func isValid(_ password: String) -> Bool {
        hasUppercaseLetter(password)
    }
    
    private func hasUppercaseLetter(_ input: String) -> Bool {
        for char in input {
            if char.isUppercase {
                return true
            }
        }
        
        return false
    }
}
