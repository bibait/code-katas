import Testing
import GrokkingAlgorithms

public class SelectionSort {
    static func sort(values: [Int]) -> [Int] {
        if values.count <= 1 {
            return values
        }
        
        var values = values
        let count = values.count
        var result = [Int]()
        
        while result.count != count {
            let (min, index) = minValue(in: values)
            
            result.append(min)
            values.remove(at: index)
        }
        
        return result
    }
    
    private static func minValue(in values: [Int]) -> (Int, Int) {
        var result: (Int, Int)?

        for (index, value) in values.enumerated() {
            if result == nil {
                result = (value, index)
                continue
            }
            
            if value < result!.0 {
                result = (value, index)
            }
        }
        
        return result!
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
    
    @Test
    func sort_withTwoElements_shouldReturnSorted() {
        #expect(sort(values: [2, 1]) == [1, 2])
    }
    
    // MARK: - Helpers
    
    private func sort(values: [Int]) -> [Int] {
        SelectionSort.sort(values: values)
    }
    
}
