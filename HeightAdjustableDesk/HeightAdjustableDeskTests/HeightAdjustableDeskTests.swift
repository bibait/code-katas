import Testing

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

struct HeightAdjustableDeskTests {

    @Test
    func hasInitialHeightAt100cm() {
        let sut = makeSUT()
        
        #expect(sut.height == 100)
    }
    
    @Test
    func hasMaxAndMinHeight() {
        let sut = makeSUT(minHeight: 50, maxHeight: 150)
        
        #expect(sut.minHeight == 50)
        #expect(sut.maxHeight == 150)
    }
    
    @Test
    func applySavedPosition_withoutSaving_staysAtSamePosition() {
        let sut = makeSUT()
        
        sut.applySavedPosition(number: 1)
        #expect(sut.height == 100)
        
        sut.applySavedPosition(number: 2)
        #expect(sut.height == 100)
        
        sut.applySavedPosition(number: 3)
        #expect(sut.height == 100)
        
        sut.applySavedPosition(number: 4)
        #expect(sut.height == 100)
    }
    
    @Test
    func savesPosition() {
        let sut = makeSUT()
        
        sut.moveUp()
        sut.savePosition(number: 1)
        sut.moveDown()
        sut.applySavedPosition(number: 1)
        
        #expect(sut.height == 101)
    }
    
    @Test
    func overridesSavedPosition() {
        let sut = makeSUT()
        
        sut.moveUp() // 101
        sut.savePosition(number: 1)
        sut.moveDown() // 100
        sut.moveDown() // 99
        sut.moveDown() // 98
        sut.savePosition(number: 1)
        sut.moveUp() // 99
        sut.applySavedPosition(number: 1)
        
        #expect(sut.height == 98)
    }
    
    // MARK: - Movement
    
    @Test
    func moveUp_increasesHeightByOneCm() {
        let sut = makeSUT(initialHeight: 100)
        
        sut.moveUp()
        
        #expect(sut.height == 101)
    }
    
    @Test
    func moveUp_doesNotSurpassMaxHeight() {
        let sut = makeSUT(initialHeight: 100, maxHeight: 100)
        
        sut.moveUp()
        
        #expect(sut.height == 100)
    }
    
    @Test
    func moveDown_decreasesHeightByOneCm() {
        let sut = makeSUT(initialHeight: 100)
        
        sut.moveDown()
        
        #expect(sut.height == 99)
    }
    
    @Test
    func moveDown_doesNotSurpassMinHeight() {
        let sut = makeSUT(initialHeight: 100, minHeight: 100)
        
        sut.moveDown()
        
        #expect(sut.height == 100)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(
        initialHeight: Double = 100,
        minHeight: Double = 50,
        maxHeight: Double = 150
    ) -> HeightAdjustableDesk {
        HeightAdjustableDesk(initialHeight: initialHeight, minHeight: minHeight, maxHeight: maxHeight)
    }

}
