public class BinarySearch {
    public static func search<T: Comparable>(in array: [T], target: T) -> Int? {
        var lowerBound = 0
        var upperBound = array.count - 1
        
        while lowerBound <= upperBound {
            let searchIndex = lowerBound + (upperBound - lowerBound) / 2
            let value = array[searchIndex]
            
            if value == target {
                return searchIndex
            }
            
            if value > target {
                upperBound = searchIndex - 1
            } else {
                lowerBound = searchIndex + 1
            }
        }
        
        return nil
    }
}
