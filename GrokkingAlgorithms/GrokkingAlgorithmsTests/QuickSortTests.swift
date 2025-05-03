import Testing
import GrokkingAlgorithms

struct QuickSortTests {
    
    @Test
    func sort_withNoElements_shouldReturnEmptyArray() {
        #expect(sort([]).isEmpty)
        #expect(sort([1]) == [1])
        #expect(sort([1, 2]) == [1, 2])
        #expect(sort([2, 1]) == [1, 2])
        #expect(sort([2, 3, 1]) == [1, 2, 3])
        #expect(sort([2, 3, 1, 1, 2, 10, 12, 120]) == [1, 1, 2, 2, 3, 10, 12, 120])
        #expect(sort([1, 1, 2, 2, 3, 10, 12, 120]) == [1, 1, 2, 2, 3, 10, 12, 120])
    }
    
    // MARK: - Helpers
    
    private func sort(_ values: [Int]) -> [Int] {
        QuickSort.sort(values)
    }
    
}
