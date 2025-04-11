import Foundation

public class InputNotNull: PasswordRule {
    public struct EmptyPassword: Error {}

    public func verify(_ password: String) throws {
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            throw EmptyPassword()
        }
    }
}
