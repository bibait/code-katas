import Testing
import GrokkingAlgorithms

public class QuickSort {
    public static func sort(_ values: [Int]) -> [Int] {
        []
    }
}

struct QuickSortTests {
    
    @Test
    func sort_withNoElements_shouldReturnEmptyArray() {
        let result = QuickSort.sort([])
        
        #expect(result.isEmpty)
    }
    
}
