import Foundation

class TripDAO: TripDAOService
{
    func findTripsByUser(_ user:User) throws -> [Trip]?
    {
        throw UnitTestErrorType.dependendClassCallDuringUnitTest
    }
    
}
