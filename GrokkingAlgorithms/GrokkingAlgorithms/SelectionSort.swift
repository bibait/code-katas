public class SelectionSort {
    public static func sort<T: Comparable>(values: [T]) -> [T] {
        guard values.count > 1 else { return values }
        
        var values = values
        let count = values.count
        var result = [T]()
        
        while result.count != count {
            let (minValue, index) = minValue(in: values)
            
            result.append(minValue)
            values.remove(at: index)
        }
        
        return result
    }
    
    private static func minValue<T: Comparable>(in values: [T]) -> (T, Int) {
        var result = (minValue: values[0], index: 0)

        for (index, value) in values.enumerated() {
            if value < result.minValue {
                result = (value, index)
            }
        }
        
        return result
    }
}
