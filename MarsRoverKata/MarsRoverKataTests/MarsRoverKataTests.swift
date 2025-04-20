import Testing
import MarsRoverKata

public class Position {
    var position: Coordinate
    var direction: Direction
    
    public init(position: Coordinate, direction: Direction) {
        self.position = position
        self.direction = direction
    }
}

public enum Direction {
    case north, south, east, west
    
    func turnLeft() -> Direction {
        switch self {
        case .north:
            return .west
            
        case .south:
            return .east
            
        case .east:
            return .north
            
        case .west:
            return .south
        }
    }
    
    func turnRight() -> Direction {
        switch self {
        case .north:
            return .east
            
        case .south:
            return .west
            
        case .east:
            return .south
            
        case .west:
            return .north
        }
    }
}

public struct Coordinate: Equatable {
    let x: Int
    let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func moveX(by value: Int) -> Coordinate {
        return Coordinate(x: x + value, y: y)
    }
    
    func moveY(by value: Int) -> Coordinate {
        return Coordinate(x: x, y: y + value)
    }
}

public struct Map {
    let tiles: [[Tile]]
    
    public init(tiles: [[Tile]]) {
        self.tiles = tiles
    }
}

public struct Tile {
    let isObstacle: Bool
    
    public init(isObstacle: Bool) {
        self.isObstacle = isObstacle
    }
}

public class MarsRover {
    private let map: Map
    
    public var roverPosition: Position

    public init(startingPosition: Position, map: Map) {
        self.roverPosition = startingPosition
        self.map = map
    }
    
    public func move(commands: [Command]) {
        commands.forEach { $0.execute(on: self) }
    }
}

public protocol Command {
    func execute(on rover: MarsRover)
}

public struct MoveForward: Command {
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
    public func execute(on rover: MarsRover) {
        rover.roverPosition.direction = rover.roverPosition.direction.turnLeft()
    }
}

public struct TurnRight: Command {
    public func execute(on rover: MarsRover) {
        rover.roverPosition.direction = rover.roverPosition.direction.turnRight()
    }
}

struct MarsRoverKataTests {

    @Test
    func move_withoutObstacles() {
        let sut = MarsRover(
            startingPosition: .init(
                position: Coordinate(x: 0, y: 0),
                direction: .east
            ),
            map: .init(tiles: [
                [
                    .init(isObstacle: false),
                    .init(isObstacle: false),
                    .init(isObstacle: false),
                    .init(isObstacle: false),
                ],
                [
                    .init(isObstacle: false),
                    .init(isObstacle: false),
                    .init(isObstacle: false),
                    .init(isObstacle: false),
                ],
            ])
        )
        
        sut.move(commands: [
            MoveForward(),
            MoveForward(),
        ])
        
        #expect(sut.roverPosition.position == .init(x: 2, y: 0))
    }

}
