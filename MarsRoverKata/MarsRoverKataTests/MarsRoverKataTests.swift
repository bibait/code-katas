import Testing
import MarsRoverKata

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
