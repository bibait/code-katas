import Testing
import GrokkingAlgorithms

public class BinarySearch {
    public static func search(in array: [Int], target: Int) -> Int? {
        if array.isEmpty || !array.contains(target) {
            return nil
        }
        
        var lowerBound = 0
        var upperBound = array.count - 1
        
        while lowerBound <= upperBound {
            var searchIndex = lowerBound + upperBound
            let guess = array[searchIndex]
            
            if guess == target {
                return searchIndex
            }
            
            if guess > target {
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
    
    @Test
    func withExistingElement_shouldReturnIndex() {
        let result = search(array: [1, 2], target: 2)
        
        #expect(result == 1)
    }
    
    // MARK: - Helpers
    
    private func search(array: [Int], target: Int) -> Int? {
        BinarySearch.search(in: array, target: target)
    }

}
