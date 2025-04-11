public protocol PasswordRule {
    func verify(_ password: String) throws
}
