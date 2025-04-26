import Testing
import GrokkingAlgorithms

public class SelectionSort {
    static func sort(values: [Int]) -> [Int] {
        values
    }
}

struct SelectionSortTests {
    
    @Test
    func sort_withNoElements_shouldReturnEmptyArray() {
        let result = SelectionSort.sort(values: [])
        
        #expect(result.isEmpty)
    }
    
    @Test
    func sort_withOneElement_shouldReturnArray() {
        let result = SelectionSort.sort(values: [1])
        
        #expect(result == [1])
    }
    
}
