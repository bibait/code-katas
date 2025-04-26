import Foundation

protocol TripDAOService {
    func findTripsByUser(_ user: User) throws -> [Trip]?
}

class TripService
{
    private let userSession: UserSession
    private let tripDAO: TripDAOService
    
    init(
        userSession: UserSession = UserSession.sharedInstance,
        tripDAO: TripDAOService = TripDAO()
    ) {
        self.userSession = userSession
        self.tripDAO = tripDAO
    }

    func getTripsByUser(_ user:User) throws -> [Trip]?
    {
        var tripList:[Trip]? = nil
        let loggedUser = try! userSession.getLoggedUser()
        
        var isFriend = false
        
        if let loggedUser = loggedUser {
            for friend in user.getFriends() {
                if friend == loggedUser {
                    isFriend = true
                    break
                }
            }
            if isFriend {
                tripList = try! tripDAO.findTripsByUser(user)
            }
            return tripList
        }
        else {
            throw TripServiceErrorType.userNotLoggedIn
        }
    }
}
