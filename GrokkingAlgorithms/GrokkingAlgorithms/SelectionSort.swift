public class SelectionSort {
    public static func sort(values: [Int]) -> [Int] {
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
