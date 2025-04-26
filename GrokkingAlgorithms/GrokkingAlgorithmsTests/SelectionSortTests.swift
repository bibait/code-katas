import Testing
import GrokkingAlgorithms

struct SelectionSortTests {
    
    @Test
    func sort_withNoElements_shouldReturnEmptyArray() {
        #expect(sort(values: []).isEmpty)
    }
    
    @Test
    func sort_withOneElement_shouldReturnArray() {
        #expect(sort(values: [1]) == [1])
    }
    
    @Test(arguments: [
        ([2, 1], [1, 2]),
        ([1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]),
        ([2, 1, 3, 10, 20], [1, 2, 3, 10, 20]),
        ([2, 1, -1, -10, 123], [-10, -1, 1, 2, 123]),
        ([2, 1, 1, 10, 1, 2, 10, 30], [1, 1, 1, 2, 2, 10, 10, 30]),
    ])
    func sort_withUnsortedArray_shouldReturnSorted(values: [Int], expected: [Int]) {
        #expect(sort(values: values) == expected)
    }
    
    @Test
    func sort_withSortedArray_shouldReturnArray() {
        #expect(sort(values: [1, 2, 30, 1234, 12341234]) == [1, 2, 30, 1234, 12341234])
    }
    
    // MARK: - Helpers
    
    private func sort(values: [Int]) -> [Int] {
        SelectionSort.sort(values: values)
    }
    
}
