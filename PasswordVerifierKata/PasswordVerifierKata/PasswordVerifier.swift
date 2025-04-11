public class PasswordVerifier {
    public init() {}
    
    public func verify(_ password: String) throws {
        try PasswordRuleFactory
            .makeRules()
            .forEach {
                if !$0.isValid(password) {
                    throw $0.error
                }
            }
    }
}
