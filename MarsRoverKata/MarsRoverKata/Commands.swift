public protocol Command {
    func execute(on rover: MarsRover)
}

public struct MoveForward: Command {
    public init() {}

    public func execute(on rover: MarsRover) {
        switch rover.roverPosition.direction {
        case .north:
            rover.roverPosition.position = rover.roverPosition.position.moveY(by: -1)
            
        case .south:
            rover.roverPosition.position = rover.roverPosition.position.moveY(by: 1)
            
        case .east:
            rover.roverPosition.position = rover.roverPosition.position.moveX(by: 1)
            
        case .west:
            rover.roverPosition.position = rover.roverPosition.position.moveX(by: -1)
        }
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
