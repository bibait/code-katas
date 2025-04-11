public class MinimumOneNumber: PasswordRule {
    public struct NoNumber: Error {}

    public var error: Error {
        NoNumber()
    }
    
    public func isValid(_ password: String) -> Bool {
        hasNumber(password)
    }
    
    private func hasNumber(_ input: String) -> Bool {
        for char in input {
            if char.isNumber {
                return true
            }
        }
        
        return false
    }
}
