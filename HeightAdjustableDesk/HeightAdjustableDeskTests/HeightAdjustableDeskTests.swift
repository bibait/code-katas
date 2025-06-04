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
    
    public func applySavedPosition(number: Int) {
    }
    
    public func moveUp() {
        height += 1
    }
}

struct HeightAdjustableDeskTests {

    @Test
    func hasInitialHeightAt100cm() {
        let sut = HeightAdjustableDesk()
        
        #expect(sut.height == 100)
    }
    
    @Test
    func hasMaxAndMinHeight() {
        let sut = HeightAdjustableDesk(minHeight: 50, maxHeight: 150)
        
        #expect(sut.minHeight == 50)
        #expect(sut.maxHeight == 150)
    }
    
    @Test
    func applySavedPosition_withoutSaving_staysAtSamePosition() {
        let sut = HeightAdjustableDesk()
        
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
    func moveUp_increasesHeightByOneCm() {
        let sut = HeightAdjustableDesk(initialHeight: 100)
        
        sut.moveUp()
        
        #expect(sut.height == 101)
    }

}
