import Testing
@testable import TripServiceKata

struct TripServiceTests {
    private let userSession: TestableUserSession
    
    init() {
        userSession = TestableUserSession()
    }

    @Test
    func getTripsByUser() throws {
        userSession.user = User()
        let sut = TripService(userSession: userSession)
        
        let result = try sut.getTripsByUser(userSession.user!)
        
        #expect(result == nil)
    }
    
    @Test
    func getTripsByUser_withoutLoggedInUser() throws {
        let sut = TripService(userSession: userSession)
        
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
        let loggedInUser = User()
        let friend = friend(of: loggedInUser)
        userSession.user = loggedInUser
        let tripDAO = FakeTripDAOService(trips: trips)
        let sut = TripService(userSession: userSession, tripDAO: tripDAO)
        
        let result = try sut.getTripsByUser(friend)
        
        #expect(result! == trips)
    }
    
    @Test
    func getTripsByUser_withFriend_withoutTrips() throws {
        let loggedInUser = User()
        let friend = friend(of: loggedInUser)
        userSession.user = loggedInUser
        let tripDAO = FakeTripDAOService(trips: [])
        let sut = TripService(userSession: userSession, tripDAO: tripDAO)
        
        let result = try sut.getTripsByUser(friend)
        
        #expect(result!.isEmpty)
    }
    
    @Test
    func getTripsByUser_withoutFriend() throws {
        let loggedInUser = User()
        let unknownUser = User()
        userSession.user = loggedInUser
        let tripDAO = FakeTripDAOService(trips: [])
        let sut = TripService(userSession: userSession, tripDAO: tripDAO)
        
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
        var user: User?

        override func getLoggedUser() throws -> User? {
            user
        }
    }
    
    private class FakeTripDAOService: TripDAO {
        let trips: [Trip]?
        
        init(trips: [Trip]?) {
            self.trips = trips
        }

        override func findTripsByUser(_ user: User) throws -> [Trip]? {
            trips
        }
    }

}
