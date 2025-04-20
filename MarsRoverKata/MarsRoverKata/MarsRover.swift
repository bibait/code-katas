import Foundation

@Observable
public class MarsRover {
    public let map: Map
    public var roverPosition: Position

    public init(startingPosition: Position, map: Map) {
        self.roverPosition = startingPosition
        self.map = map
    }
    
    public func move(commands: [Command]) {
        commands.forEach { $0.execute(on: self) }
    }
}
