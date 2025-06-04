import Testing

public class HeightAdjustableDesk {
    private(set) var height: Double

    public init(height: Double = 100) {
        self.height = height
    }
}

struct HeightAdjustableDeskTests {

    @Test
    func hasInitialHeightAt100cm() {
        let sut = HeightAdjustableDesk()
        
        #expect(sut.height == 100)
    }

}
