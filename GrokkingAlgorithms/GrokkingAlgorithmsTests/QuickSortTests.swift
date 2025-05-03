import Testing
import GrokkingAlgorithms

public class QuickSort {
    public static func sort(_ values: [Int]) -> [Int] {
        if values.count < 2 {
            return values
        }
        
        let pivotElement = values.first!
        
        var sorted = [pivotElement]
        var smaller = [Int]()
        var bigger = [Int]()
        
        for (index, value) in values.enumerated() {
            if index == 0 { continue }

            if value < pivotElement {
                smaller.append(value)
            } else if value == pivotElement {
                sorted.append(value)
            } else {
                bigger.append(value)
            }
        }

        return sort(smaller) + sorted + sort(bigger)
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
    
    // MARK: - Helpers
    
    private func sort(_ values: [Int]) -> [Int] {
        QuickSort.sort(values)
    }
    
}
