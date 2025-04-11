public class MinimumOneUppercase: PasswordRule {
    public struct NoUppercase: Error {}

    public func verify(_ password: String) throws {
        guard hasUppercaseLetter(password) else {
            throw NoUppercase()
        }
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
