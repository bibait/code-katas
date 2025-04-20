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
        for command in commands {
            switch command.type {
            case .moveForward:
                switch roverPosition.direction {
                case .north:
                    roverPosition.position = roverPosition.position.moveY(by: -1)
                    
                case .south:
                    roverPosition.position = roverPosition.position.moveY(by: 1)
                    
                case .east:
                    roverPosition.position = roverPosition.position.moveX(by: 1)
                    
                case .west:
                    roverPosition.position = roverPosition.position.moveX(by: -1)
                }
                
            case .turnLeft:
                switch roverPosition.direction {
                case .north:
                    roverPosition.direction = .west
                    
                case .south:
                    roverPosition.direction = .east
                    
                case .east:
                    roverPosition.direction = .north
                    
                case .west:
                    roverPosition.direction = .south
                }
                
            case .turnRight:
                switch roverPosition.direction {
                case .north:
                    roverPosition.direction = .east
                    
                case .south:
                    roverPosition.direction = .west
                    
                case .east:
                    roverPosition.direction = .south
                    
                case .west:
                    roverPosition.direction = .north
                }
            }
        }
    }
}

public struct Command {
    let type: CommandType
    
    public init(type: CommandType) {
        self.type = type
    }
    
    public enum CommandType {
        case moveForward
        case turnLeft
        case turnRight
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
            .init(type: .moveForward),
            .init(type: .moveForward),
        ])
        
        #expect(sut.roverPosition.position == .init(x: 2, y: 0))
    }
    
    @Test
    func move_withoutObstacles2() {
        let sut = MarsRover(
            startingPosition: .init(
                position: Coordinate(x: 0, y: 0),
                direction: .south
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
            .init(type: .moveForward),
            .init(type: .moveForward),
            .init(type: .turnLeft),
            .init(type: .moveForward),
        ])
        
        #expect(sut.roverPosition.position == .init(x: 1, y: 2))
    }

}
