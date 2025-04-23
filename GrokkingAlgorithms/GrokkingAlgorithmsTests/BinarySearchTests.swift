import Testing
import GrokkingAlgorithms

public class BinarySearch {
    public static func search(in array: [Int], target: Int) -> Int? {
        var lowerBound = 0
        var upperBound = array.count - 1
        
        while lowerBound <= upperBound {
            let searchIndex = lowerBound + (upperBound - lowerBound) / 2
            let value = array[searchIndex]
            
            if value == target {
                return searchIndex
            }
            
            if value > target {
                upperBound = searchIndex - 1
            } else {
                lowerBound = searchIndex + 1
            }
        }
        
        return nil
    }
}

struct BinarySearchTests {
    
    @Test
    func withEmptyArray_shouldReturnNil() {
        let result = search(array: [], target: 1)
        
        #expect(result == nil)
    }

    @Test
    func withOneElement_shouldReturnIndexZero() {
        let result = search(array: [1], target: 1)
        
        #expect(result == 0)
    }
    
    @Test
    func withoutElement_shouldReturnNil() {
        let result = search(array: [1], target: 2)
        
        #expect(result == nil)
    }
    
    @Test(arguments: [
        ([1, 2], 2, 1),
        ([4, 5, 10, 20, 100, 9012], 10, 2),
        ([10, 50, 100, 1000, 5000, 100000, 150000], 100000, 5),
        ([1, 2, 3, 4, 5, 7, 8, 9], 1, 0),
    ])
    func withExistingElement_shouldReturnIndex(array: [Int], target: Int, expectedIndex: Int) {
        let result = search(array: array, target: target)
        
        #expect(result == expectedIndex)
    }
    
    // MARK: - Helpers
    
    private func search(array: [Int], target: Int) -> Int? {
        BinarySearch.search(in: array, target: target)
    }

}
