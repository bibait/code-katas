import Testing
import GrokkingAlgorithms

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
    
    @Test
    func sort_withTwoUnsortedElements_shouldReturnSorted() {
        #expect(sort([2, 1]) == [1, 2])
    }
    
    @Test
    func sort_withThreeUnsortedElements_shouldReturnSorted() {
        #expect(sort([2, 3, 1]) == [1, 2, 3])
    }
    
    @Test
    func sort_withMoreUnsortedElements_shouldReturnSorted() {
        #expect(sort([2, 3, 1, 1, 2, 10, 12, 120]) == [1, 1, 2, 2, 3, 10, 12, 120])
    }
    
    @Test
    func sort_withMoreSortedElements_shouldReturnSorted() {
        #expect(sort([1, 1, 2, 2, 3, 10, 12, 120]) == [1, 1, 2, 2, 3, 10, 12, 120])
    }
    
    // MARK: - Helpers
    
    private func sort(_ values: [Int]) -> [Int] {
        QuickSort.sort(values)
    }
    
}
