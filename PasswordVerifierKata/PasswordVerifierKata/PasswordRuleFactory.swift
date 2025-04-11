public class PasswordRuleFactory {
    static func makeRules() -> [PasswordRule] {
        [
            MinimumEightCharacters(),
            InputNotNull(),
            MinimumOneUppercase(),
            MinimumOneLowercase(),
            MinimumOneNumber(),
        ]
    }
}
