import Testing
import GrokkingAlgorithms

public class SelectionSort {
    static func sort(values: [Int]) -> [Int] {
        return []
    }
}

struct SelectionSortTests {
    
    @Test
    func sort_withNoElements_shouldReturnEmptyArray() {
        let result = SelectionSort.sort(values: [])
        
        #expect(result.isEmpty)
    }
    
}
