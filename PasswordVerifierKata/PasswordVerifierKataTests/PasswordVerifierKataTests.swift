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

public class PasswordVerifier {
    public init() {}
    
    enum Error: Swift.Error {
        case lessThanEightCharacters
        case emptyPassword
        case noUppercase
    }
    
    public func verify(_ password: String) throws {
        let eightCharactersRule = MinimumEightCharacters()
        try eightCharactersRule.verify(password)
        
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            throw Error.emptyPassword
        }

        guard hasUppercaseLetter(password) else {
            throw Error.noUppercase
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

/**
 Password Verifier Kata:
 
 1. password should be larger than 8 chars ✅
 2. password should not be null ✅
 3. password should have one uppercase letter at least
 4. password should have one lowercase letter at least
 5. password should have one number at least
 
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
        
        #expect(throws: PasswordVerifier.Error.emptyPassword) {
            try sut.verify("        ")
        }
    }
    
    @Test
    func withNoUppercaseLetter_throwsError() {
        let sut = PasswordVerifier()
        
        #expect(throws: PasswordVerifier.Error.noUppercase) {
            try sut.verify("invalidpassword")
        }
    }

}
