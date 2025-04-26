import Testing
@testable import TripServiceKata

struct TripServiceTests {

    @Test
    func getTripsByUser() throws {
        let userSession = TestableUserSession()
        userSession.user = User()
        let sut = TripService()
        sut.userSession = userSession
        
        let result = try sut.getTripsByUser(userSession.user!)
        
        #expect(result == nil)
    }
    
    @Test
    func getTripsByUser_withoutLoggedInUser() throws {
        let userSession = TestableUserSession()
        let sut = TripService()
        sut.userSession = userSession
        
        #expect(throws: TripServiceErrorType.userNotLoggedIn) {
            try sut.getTripsByUser(User())
        }
    }
    
    // MARK: - Helpers
    
    private class TestableUserSession: UserSession {
        var user: User?

        override func getLoggedUser() throws -> User? {
            user
        }
    }

}
