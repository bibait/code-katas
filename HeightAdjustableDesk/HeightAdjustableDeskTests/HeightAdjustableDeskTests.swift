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

}
