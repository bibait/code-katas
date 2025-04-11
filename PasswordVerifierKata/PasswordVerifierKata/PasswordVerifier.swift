public class PasswordVerifier {
    public init() {}
    
    public func verify(_ password: String) throws {
        try PasswordRuleFactory
            .makeRules()
            .forEach {
                try $0.verify(password)
            }
    }
}
