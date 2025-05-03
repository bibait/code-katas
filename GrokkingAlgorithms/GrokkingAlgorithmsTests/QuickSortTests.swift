import Testing
import GrokkingAlgorithms

struct QuickSortTests {
    
    @Test
    func sort_withNoElements_shouldReturnEmptyArray() {
        #expect(sortAscending([]).isEmpty)
    }
    
    @Test
    func sort_withOneElement_shouldReturnUnsorted() {
        #expect(sortAscending([1]) == [1])
    }
    
    @Test
    func sortAscending() {
        #expect(sortAscending([1, 2]) == [1, 2])
        #expect(sortAscending([2, 1]) == [1, 2])
        #expect(sortAscending([2, 3, 1]) == [1, 2, 3])
        #expect(sortAscending([2, 3, 1, 1, 2, 10, 12, 120]) == [1, 1, 2, 2, 3, 10, 12, 120])
        #expect(sortAscending([1, 1, 2, 2, 3, 10, 12, 120]) == [1, 1, 2, 2, 3, 10, 12, 120])
    }
    
    @Test
    func sortDescending() {
        #expect(sortDescending([1, 2]) == [2, 1])
        #expect(sortDescending([2, 1]) == [2, 1])
        #expect(sortDescending([2, 3, 1]) == [3, 2, 1])
        #expect(sortDescending([2, 3, 1, 1, 2, 10, 12, 120]) == [120, 12, 10, 3, 2, 2, 1, 1])
        #expect(sortDescending([120, 12, 10, 3, 2, 2, 1, 1]) == [120, 12, 10, 3, 2, 2, 1, 1])
    }
    
    // MARK: - Helpers
    
    private func sortAscending(_ values: [Int]) -> [Int] {
        QuickSort.sort(values, .ascending)
    }
    
    private func sortDescending(_ values: [Int]) -> [Int] {
        QuickSort.sort(values, .descending)
    }
    
}
