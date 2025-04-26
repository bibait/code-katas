import Testing
import GrokkingAlgorithms

struct SelectionSortTests {
    
    @Test(arguments: [
        ([], []),
        ([1], [1]),
        ([2, 1], [1, 2]),
        ([1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]),
        ([2, 1, 3, 10, 20], [1, 2, 3, 10, 20]),
        ([2, 1, -1, -10, 123], [-10, -1, 1, 2, 123]),
        ([2, 1, 1, 10, 1, 2, 10, 30], [1, 1, 1, 2, 2, 10, 10, 30]),
    ])
    func sortAscending(values: [Int], expected: [Int]) {
        #expect(sortAscending(values: values) == expected)
    }
    
    @Test(arguments: [
        ([], []),
        ([1], [1]),
        ([2, 1], [2, 1]),
        ([1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]),
        ([2, 1, 3, 10, 20], [20, 10, 3, 2, 1]),
        ([2, 1, -1, -10, 123], [123, 2, 1, -1, -10]),
        ([2, 1, 1, 10, 1, 2, 10, 30], [30, 10, 10, 2, 2, 1, 1, 1]),
    ])
    func sortDescending(values: [Int], expected: [Int]) {
        #expect(sortDescending(values: values) == expected)
    }
    
    // MARK: - Helpers
    
    private func sortDescending(values: [Int]) -> [Int] {
        SelectionSort.sort(values: values, .descending)
    }
    
    private func sortAscending(values: [Int]) -> [Int] {
        SelectionSort.sort(values: values, .ascending)
    }
    
}
