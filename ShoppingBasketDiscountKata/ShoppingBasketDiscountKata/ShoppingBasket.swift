public class ShoppingBasket {
    private var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    private lazy var discounts = DiscountFactory.makeDiscounts()
    
    public func addItem(_ item: Item) {
        items.append(item)
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
