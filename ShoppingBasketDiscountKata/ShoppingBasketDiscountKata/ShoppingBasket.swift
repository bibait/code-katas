public class ShoppingBasket {
    private let items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    private lazy var discounts = DiscountFactory.makeDiscounts()
    
    public func getItemQuantity(name: String) -> Int {
        items
            .count { $0.name == name }
    }
    
    public func calculateTotalPrice() -> Float {
        let total = items
            .reduce(0) { $0 + $1.price }
                
        for discount in discounts {
            if discount.doesApply(to: total) {
                return discount.apply(to: total)
            }
        }
                
        return total
    }
}

struct DiscountFactory {
    static func makeDiscounts() -> [Discount] {
        [
            Discount(threshold: 200, discountRate: 0.1),
            Discount(threshold: 100, discountRate: 0.05)
        ]
    }
}

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
