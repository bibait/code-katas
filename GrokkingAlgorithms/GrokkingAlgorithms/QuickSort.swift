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
