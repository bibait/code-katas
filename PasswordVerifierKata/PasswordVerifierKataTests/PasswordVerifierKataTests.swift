import Testing
import PasswordVerifierKata

public protocol PasswordRule {
    func verify(_ password: String) throws
}

public class MinimumEightCharacters: PasswordRule {
    public struct LessThanEightCharacters: Error {}

    public func verify(_ password: String) throws {
        guard password.count >= 8 else {
            throw LessThanEightCharacters()
        }
    }
}

public class InputNotNull: PasswordRule {
    public struct EmptyPassword: Error {}

    public func verify(_ password: String) throws {
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            throw EmptyPassword()
        }
    }
}

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

public class MinimumOneLowercase: PasswordRule {
    public struct NoLowercase: Error {}

    public func verify(_ password: String) throws {
        guard hasLowercaseLetter(password) else {
            throw NoLowercase()
        }
    }
    
    private func hasLowercaseLetter(_ input: String) -> Bool {
        for char in input {
            if char.isLowercase {
                return true
            }
        }
        
        return false
    }
}

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

/**
 Password Verifier Kata:
 
 1. password should be larger than 8 chars ✅
 2. password should not be null ✅
 3. password should have one uppercase letter at least ✅
 4. password should have one lowercase letter at least ✅
 5. password should have one number at least ✅
 
 Each one of these should throw an exception with a different message of your choosing.
 
 6. Add feature: password is OK if at least three of the previous conditions is true
 7. Add feature: password is never OK if item 4 is not true
 */

struct PasswordVerifierKataTests {

    @Test
    func lessThanEightCharacters_throwsError() {
        let sut = PasswordVerifier()
        
        #expect(throws: MinimumEightCharacters.LessThanEightCharacters.self) {
            try sut.verify("invalid")
        }
    }
    
    @Test
    func emptyString_throwsError() {
        let sut = PasswordVerifier()
        
        #expect(throws: InputNotNull.EmptyPassword.self) {
            try sut.verify("        ")
        }
    }
    
    @Test
    func withNoUppercaseLetter_throwsError() {
        let sut = PasswordVerifier()
        
        #expect(throws: MinimumOneUppercase.NoUppercase.self) {
            try sut.verify("invalidpassword")
        }
    }
    
    @Test
    func withNoLowercaseLetter_throwsError() {
        let sut = PasswordVerifier()
        
        #expect(throws: MinimumOneLowercase.NoLowercase.self) {
            try sut.verify("PASSWORD")
        }
    }
    
    @Test
    func withNoNumber_throwsError() {
        let sut = PasswordVerifier()
        
        #expect(throws: MinimumOneNumber.NoNumber.self) {
            try sut.verify("Password")
        }
    }

}
