public protocol PasswordRule {
    var error: Error { get }

    func isValid(_ password: String) -> Bool
}
