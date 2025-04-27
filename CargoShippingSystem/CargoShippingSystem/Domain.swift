import Foundation

struct Customer {
    let customerId: String
    let name: String
}

struct Cargo {
    let trackingId: String
}

struct DeliveryHistory {}

struct DeliverySpecification {
    let arrivalTime: Date
}

struct HandlingEvent {
    let completionTime: Date
    let type: String
}

struct CarrierMovement {
    let scheduleId: String
}

struct Location {
    let portCode: String
}
