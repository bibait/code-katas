import Foundation

public class InputNotNull: PasswordRule {
    public struct EmptyPassword: Error {}

    public var error: Error {
        EmptyPassword()
    }
    
    public func isValid(_ password: String) -> Bool {
        !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
