import Testing
import MarsRoverKata

public struct Position {
    let position: Coordinate
    let direction: Direction
    
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
    private let startingPosition: Position
    private let map: Map
    
    public init(startingPosition: Position, map: Map) {
        self.startingPosition = startingPosition
        self.map = map
    }
    
    public var roverPosition: Coordinate {
        .init(x: 2, y: 0)
    }
    
    public func move(commands: [Command]) {
        
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
        
        #expect(sut.roverPosition == .init(x: 2, y: 0))
    }

}
