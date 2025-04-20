public protocol Command {
    func execute(on rover: MarsRover)
}

public struct MoveForward: Command {
    public init() {}

    public func execute(on rover: MarsRover) {
        switch rover.roverPosition.direction {
        case .north:
            if isObstacle(at: rover.roverPosition.position.moveY(by: -1), on: rover.map) {
                return
            }

            rover.roverPosition.position = rover.roverPosition.position.moveY(by: -1)
            
        case .south:
            if isObstacle(at: rover.roverPosition.position.moveY(by: 1), on: rover.map) {
                return
            }
            
            rover.roverPosition.position = rover.roverPosition.position.moveY(by: 1)
            
        case .east:
            if isObstacle(at: rover.roverPosition.position.moveX(by: 1), on: rover.map) {
                return
            }

            rover.roverPosition.position = rover.roverPosition.position.moveX(by: 1)
            
        case .west:
            if isObstacle(at: rover.roverPosition.position.moveX(by: -1), on: rover.map) {
                return
            }

            rover.roverPosition.position = rover.roverPosition.position.moveX(by: -1)
        }
    }
    
    private func isObstacle(at position: Coordinate, on map: Map) -> Bool {
        if position.x < 0 || position.y < 0 || position.x >= map.tiles[0].count || position.y >= map.tiles.count {
            return true
        }

        return map.tiles[position.y][position.x].isObstacle
    }
}

public struct TurnLeft: Command {
    public init() {}

    public func execute(on rover: MarsRover) {
        rover.roverPosition.direction = rover.roverPosition.direction.turnLeft()
    }
}

public struct TurnRight: Command {
    public init() {}
    
    public func execute(on rover: MarsRover) {
        rover.roverPosition.direction = rover.roverPosition.direction.turnRight()
    }
}
