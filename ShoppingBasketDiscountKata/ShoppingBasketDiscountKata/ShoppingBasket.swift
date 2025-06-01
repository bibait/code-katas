public class ShoppingBasket {
    private let items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func getItemQuantity(name: String) -> Int {
        items
            .count { $0.name == name }
    }
    
    public func calculateTotalPrice() -> Float {
        let total = items
            .reduce(0) { $0 + $1.price }
        
        if total > 200 {
            let discount = Discount(threshold: 200, discountRate: 0.1)
            return discount.apply(to: total)
        } else if total > 100 {
            let discount = Discount(threshold: 100, discountRate: 0.05)
            return discount.apply(to: total)
        }
        
        return total
    }
}

struct Discount {
    private let threshold: Float
    private let discountRate: Float
    
    init(threshold: Float, discountRate: Float) {
        self.threshold = threshold
        self.discountRate = discountRate
    }
    
    func apply(to total: Float) -> Float {
        if total > threshold {
            return total - (total * discountRate)
        }
        
        return total
    }
}
