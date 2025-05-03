import Testing
import GrokkingAlgorithms

public class QuickSort {
    public static func sort(_ values: [Int]) -> [Int] {
        if values.count < 2 {
            return values
        }
        
        let pivot = values.first!
        
        var smaller = [Int]()
        var greater = [Int]()
        
        for (index, value) in values.enumerated() {
            guard index > 0 else { continue }

            if value <= pivot {
                smaller.append(value)
            } else {
                greater.append(value)
            }
        }

        return sort(smaller) + [pivot] + sort(greater)
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
