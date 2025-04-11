import Testing
@testable import PasswordVerifierKata

public class PasswordVerifier {
    public init() {}
    
    public func verify(_ password: String) throws {
        throw NSError(domain: "Test", code: -1)
    }
}

/**
 Password Verifier Kata:
 
 1. password should be larger than 8 chars
 2. password should not be null
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
        
        #expect(throws: (any Error).self) {
            try sut.verify("invalid")
        }
    }

}
