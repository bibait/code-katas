public class QuickSort {
    public enum SortCriteria {
        case ascending, descending
    }

    public static func sort(_ values: [Int], _ criteria: SortCriteria) -> [Int] {
        guard values.count >= 2 else {
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
        
        switch criteria {
        case .ascending:
            return sort(smaller, criteria) + [pivot] + sort(greater, criteria)
        case .descending:
            return sort(greater, criteria) + [pivot] + sort(smaller, criteria)
        }
    }
}
