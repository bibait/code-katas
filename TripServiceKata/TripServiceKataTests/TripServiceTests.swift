import Testing
@testable import TripServiceKata

struct TripServiceTests {
    private let userSession: TestableUserSession
    private let tripDAO: FakeTripDAOService
    private let sut: TripService
    
    init() {
        userSession = TestableUserSession()
        tripDAO = FakeTripDAOService()
        sut = TripService(userSession: userSession, tripDAO: tripDAO)
    }

    @Test
    func getTripsByUser() throws {
        userSession.loggedInUser = User()
        
        let result = try sut.getTripsByUser(userSession.loggedInUser!)
        
        #expect(result == nil)
    }
    
    @Test
    func getTripsByUser_withoutLoggedInUser() throws {
        #expect(throws: TripServiceErrorType.userNotLoggedIn) {
            try sut.getTripsByUser(User())
        }
    }
    
    @Test
    func getTripsByUser_withFriend() throws {
        let trips: [Trip] = [
            .init(),
            .init(),
            .init(),
        ]
        userSession.loggedInUser = User()
        let friend = friend(of: userSession.loggedInUser!)
        tripDAO.trips = trips
        
        let result = try sut.getTripsByUser(friend)
        
        #expect(result! == trips)
    }
    
    @Test
    func getTripsByUser_withFriend_withoutTrips() throws {
        let loggedInUser = User()
        let friend = friend(of: loggedInUser)
        userSession.loggedInUser = loggedInUser
        tripDAO.trips = []
        
        let result = try sut.getTripsByUser(friend)
        
        #expect(result!.isEmpty)
    }
    
    @Test
    func getTripsByUser_withoutFriend() throws {
        let loggedInUser = User()
        let unknownUser = User()
        userSession.loggedInUser = loggedInUser
        tripDAO.trips = []
        
        let result = try sut.getTripsByUser(unknownUser)
        
        #expect(result == nil)
    }
    
    // MARK: - Helpers
    
    private func friend(of user: User) -> User {
        let friend = User()
        friend.addFriend(user)
        return friend
    }
    
    private class TestableUserSession: UserSession {
        var loggedInUser: User?

        override func getLoggedUser() throws -> User? {
            loggedInUser
        }
    }
    
    private class FakeTripDAOService: TripDAO {
        var trips: [Trip]?

        override func findTripsByUser(_ user: User) throws -> [Trip]? {
            trips
        }
    }

}
