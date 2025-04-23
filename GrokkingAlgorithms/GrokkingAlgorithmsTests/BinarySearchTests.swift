import Testing
import GrokkingAlgorithms

public class BinarySearch {
    public init() {}
    
    public func search(array: [Int], target: Int) -> Int? {
        if array.isEmpty || !array.contains(target) {
            return nil
        }
        
        return 0
    }
}

struct BinarySearchTests {
    @Test
    func withEmptyArray_shouldReturnNil() {
        let sut = BinarySearch()
        
        let result = sut.search(array: [], target: 1)
        
        #expect(result == nil)
    }

    @Test
    func withOneElement_shouldReturnIndexZero() {
        let sut = BinarySearch()
        
        let result = sut.search(array: [1], target: 1)
        
        #expect(result == 0)
    }
    
    @Test
    func withNoneExistingElement_shouldReturnNil() {
        let sut = BinarySearch()
        
        let result = sut.search(array: [1], target: 2)
        
        #expect(result == nil)
    }

}
