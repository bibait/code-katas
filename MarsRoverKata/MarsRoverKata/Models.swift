import Foundation

@Observable
public class Position {
    public var position: Coordinate
    public var direction: Direction
    
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
