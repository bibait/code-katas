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
            return total - (total * 0.1)
        } else if total > 100 {
            return total - (total * 0.05)
        }
        
        return total
    }
}
