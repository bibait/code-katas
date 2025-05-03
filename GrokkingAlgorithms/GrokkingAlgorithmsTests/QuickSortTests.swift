import Testing
import GrokkingAlgorithms

public class QuickSort {
    public static func sort(_ values: [Int]) -> [Int] {
        if values.count < 2 {
            return values
        }
        
        if values.first! < values.last! {
            return values
        }

        return [values[1], values[0]]
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
    
    @Test
    func sort_withTwoUnsortedElements_shouldReturnSorted() {
        #expect(sort([2, 1]) == [1, 2])
    }
    
    // MARK: - Helpers
    
    private func sort(_ values: [Int]) -> [Int] {
        QuickSort.sort(values)
    }
    
}
