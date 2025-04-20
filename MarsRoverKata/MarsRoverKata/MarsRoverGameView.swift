import SwiftUI

struct MarsRoverGameView : View {
    var marsRover: MarsRover

    var body: some View {
        VStack {
            ForEach(marsRover.map.tiles.indices, id: \.self) { y in
                HStack {
                    ForEach(marsRover.map.tiles[y].indices, id: \.self) { x in
                        let tile = marsRover.map.tiles[y][x]
                        Rectangle()
                            .fill(tile.isObstacle ? Color.red : Color.brown)
                            .frame(width: 30, height: 30)
                            .overlay {
                                if marsRover.roverPosition.position == .init(x: x, y: y) {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 20, height: 20)
                                        .overlay {
                                            switch marsRover.roverPosition.direction {
                                            case .north:
                                                Image(systemName: "arrow.up")
                                                    .foregroundColor(.white)
                                                
                                            case .south:
                                                Image(systemName: "arrow.down")
                                                    .foregroundColor(.white)
                                                
                                            case .east:
                                                Image(systemName: "arrow.right")
                                                    .foregroundColor(.white)
                                                
                                            case .west:
                                                Image(systemName: "arrow.left")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                }
                            }
                    }
                }
            }
            
            HStack {
                Button("Turn Left") {
                    marsRover.move(commands: [TurnLeft()])
                }

                Button("Move Forward") {
                    marsRover.move(commands: [MoveForward()])
                }

                Button("Turn Right") {
                    marsRover.move(commands: [TurnRight()])
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MarsRoverGameView(marsRover: .init(
        startingPosition: .init(
            position: .init(x: 0, y: 0),
            direction: .south
        ),
        map: .init(tiles: [
            [
                .init(isObstacle: false),
                .init(isObstacle: false),
                .init(isObstacle: false),
            ],
            [
                .init(isObstacle: true),
                .init(isObstacle: false),
                .init(isObstacle: false),
            ],
            [
                .init(isObstacle: false),
                .init(isObstacle: false),
                .init(isObstacle: true),
            ],
        ])
    ))
}
