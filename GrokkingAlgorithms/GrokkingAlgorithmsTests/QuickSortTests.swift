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
        #expect(sort([]).isEmpty)
    }
    
    @Test
    func sort_withOneElement_shouldReturnUnsorted() {
        #expect(sort([1]) == [1])
    }
    
    @Test
    func sort_withTwoSortedElements_shouldReturnUnsorted() {
        #expect(sort([1, 2]) == [1, 2])
    }
    
    // MARK: - Helpers
    
    private func sort(_ values: [Int]) -> [Int] {
        QuickSort.sort(values)
    }
    
}
