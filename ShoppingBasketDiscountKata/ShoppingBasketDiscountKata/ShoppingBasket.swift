public class ShoppingBasket {
    private var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    private lazy var discounts = DiscountFactory.makeDiscounts()
    
    public func addItem(_ item: Item, quantity: Int = 1) {
        for _ in 0..<quantity {
            items.append(item)
        }
    }
    
    public func removeItem(_ name: String, quantity: Int = 1) {
        for _ in 0..<quantity {
            if let index = items.firstIndex(where: { $0.name == name }) {
                items.remove(at: index)
            }
        }
    }
    
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
