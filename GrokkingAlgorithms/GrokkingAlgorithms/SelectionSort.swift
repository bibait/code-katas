public class SelectionSort {
    public enum SortCriteria {
        case ascending, descending
    }

    public static func sort<T: Comparable>(
        values: [T],
        _ criteria: SortCriteria
    ) -> [T] {
        guard values.count > 1 else { return values }
        
        var values = values
        var result = [T]()
        
        values
            .forEach { _ in
                let (value, index) = value(matching: criteria, in: values)
                
                result.append(value)
                values.remove(at: index)
            }
        
        return result
    }
    
    private static func value<T: Comparable>(
        matching criteria: SortCriteria,
        in values: [T]
    ) -> (T, Int) {
        var result = (value: values[0], index: 0)

        for (index, value) in values.enumerated() {
            switch criteria {
            case .ascending:
                if value < result.value {
                    result = (value, index)
                }
            
            case .descending:
                if value > result.value {
                    result = (value, index)
                }
            }
        }
        
        return result
    }
}
