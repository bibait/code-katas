protocol CustomerRepository {
    func findByCustomerId(_ id: String) -> Customer?
    func findByName(_ name: String) -> Customer?
    func findByCargoTrackingId(_ id: String) -> Customer?
}

protocol CargoRepository {
    func findByCargoTrackingId(_ id: String) -> Cargo?
    func findByCustomerId(_ id: String) -> Cargo?
}

protocol LocationRepository {
    func findPortByCode(_ code: String) -> Location?
    func findPortByCityName(_ name: String) -> Location?
}

protocol CarrierMovementRepository {
    func findByScheuleId(_ id: String) -> CarrierMovement?
    func findByFromTo(_ from: Location, _ to: Location) -> CarrierMovement?
}
