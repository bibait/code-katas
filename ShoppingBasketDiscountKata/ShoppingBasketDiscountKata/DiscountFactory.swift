struct DiscountFactory {
    static func makeDiscounts() -> [Discount] {
        [
            Discount(threshold: 200, discountRate: 0.1),
            Discount(threshold: 100, discountRate: 0.05)
        ]
    }
}
