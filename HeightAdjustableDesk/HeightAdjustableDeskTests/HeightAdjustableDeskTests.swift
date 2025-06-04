import Testing

public class HeightAdjustableDesk {
    private(set) public var height: Double
    private(set) public var maxHeight: Double
    private(set) public var minHeight: Double
    
    public init(
        initialHeight: Double = 100,
        maxHeight: Double = 150,
        minHeight: Double = 50
    ) {
        self.height = initialHeight
        self.maxHeight = maxHeight
        self.minHeight = minHeight
    }
    
    public func applySavedPosition(number: Int) {
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
        let sut = HeightAdjustableDesk(maxHeight: 150, minHeight: 50)
        
        #expect(sut.maxHeight == 150)
        #expect(sut.minHeight == 50)
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

}
