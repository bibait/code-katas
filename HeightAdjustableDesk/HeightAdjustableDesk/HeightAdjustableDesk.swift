public class HeightAdjustableDesk {
    private(set) public var height: Double
    private(set) public var minHeight: Double
    private(set) public var maxHeight: Double
    
    public init(
        initialHeight: Double = 100,
        minHeight: Double = 50,
        maxHeight: Double = 150
    ) {
        self.height = initialHeight
        self.minHeight = minHeight
        self.maxHeight = maxHeight
    }
    
    private var savedPositions: [Int: Double] = [:]
    
    public func savePosition(number: Int) {
        savedPositions[number] = height
    }
    
    public func applySavedPosition(number: Int) {
        if let savedHeight = savedPositions[number] {
            height = savedHeight
        }
    }
    
    public func moveUp() {
        height = min(height + 1, maxHeight)
    }
    
    public func moveDown() {
        height = max(height - 1, minHeight)
    }
}
