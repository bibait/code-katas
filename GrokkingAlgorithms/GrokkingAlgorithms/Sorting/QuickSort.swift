public class QuickSort {
    public static func sort<T: Comparable>(_ values: [T], _ criteria: SortCriteria) -> [T] {
        guard values.count >= 2 else {
            return values
        }
        
        let pivotIndex = Int(values.count / 2)
        let pivot = values[pivotIndex]
        
        var smaller = [T]()
        var greater = [T]()
        
        for (index, value) in values.enumerated() {
            guard index != pivotIndex else { continue }

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
