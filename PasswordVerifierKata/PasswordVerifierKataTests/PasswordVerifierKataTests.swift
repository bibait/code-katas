import Testing
import PasswordVerifierKata

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
