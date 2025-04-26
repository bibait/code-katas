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
        #expect(sort(values: []).isEmpty)
    }
    
    @Test
    func sort_withOneElement_shouldReturnArray() {
        #expect(sort(values: [1]) == [1])
    }
    
    // MARK: - Helpers
    
    private func sort(values: [Int]) -> [Int] {
        SelectionSort.sort(values: values)
    }
    
}
