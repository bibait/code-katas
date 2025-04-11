public class MinimumOneNumber: PasswordRule {
    public struct NoNumber: Error {}

    public func verify(_ password: String) throws {
        guard hasNumber(password) else {
            throw NoNumber()
        }
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
