struct Discount {
    private let threshold: Float
    private let discountRate: Float
    
    init(threshold: Float, discountRate: Float) {
        self.threshold = threshold
        self.discountRate = discountRate
    }
    
    func doesApply(to total: Float) -> Bool {
        total > threshold
    }
    
    func apply(to total: Float) -> Float {
        return total - (total * discountRate)
    }
}
