import Testing
import GrokkingAlgorithms

public class QuickSort {
    public static func sort(_ values: [Int]) -> [Int] {
        values
    }
}

struct QuickSortTests {
    
    @Test
    func sort_withNoElements_shouldReturnEmptyArray() {
        let result = QuickSort.sort([])
        
        #expect(result.isEmpty)
    }
    
    @Test
    func sort_withOneElement_shouldReturnUnsorted() {
        let result = QuickSort.sort([1])
        
        #expect(result == [1])
    }
    
}
