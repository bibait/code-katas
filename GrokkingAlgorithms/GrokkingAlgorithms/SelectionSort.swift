public class SelectionSort {
    public static func sort<T: Comparable>(values: [T]) -> [T] {
        if values.count <= 1 {
            return values
        }
        
        var values = values
        let count = values.count
        var result = [T]()
        
        while result.count != count {
            let (min, index) = minValue(in: values)
            
            result.append(min)
            values.remove(at: index)
        }
        
        return result
    }
    
    private static func minValue<T: Comparable>(in values: [T]) -> (T, Int) {
        var result: (T, Int)?

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
