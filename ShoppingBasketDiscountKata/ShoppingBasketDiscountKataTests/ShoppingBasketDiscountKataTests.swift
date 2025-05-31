import Testing

public struct Item {
    let name: String
    let price: Float
    
    public init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
}

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
        
        if total > 100 {
            return total - (total * 0.05)
        }
        
        return total
    }
}

struct ShoppingBasketDiscountKataTests {

    @Test
    func getItemQuantity_shouldReturnCount() {
        let sut = makeSUT(items: [
            makeApple(),
            makeApple(),
            makeBanana(),
        ])
        
        var result = sut.getItemQuantity(name: "Apple")
        #expect(result == 2)
        
        result = sut.getItemQuantity(name: "Banana")
        #expect(result == 1)
    }
    
    @Test
    func calculateTotalPrice() {
        let sut = makeSUT(items: [
            makeApple(),
            makeApple(),
            makeBanana(),
        ])
        
        let result = sut.calculateTotalPrice()
        
        #expect(result == 3.0)
    }
    
    @Test
    func appliesFivePercentDiscount_forBasketValue_greaterThan100() {
        let sut = makeSUT(items: [
            makeApple(price: 100),
            makeBanana(price: 50),
        ])
        
        let result = sut.calculateTotalPrice()
        
        #expect(result == 142.5)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(items: [Item] = []) -> ShoppingBasket {
         ShoppingBasket(items: items)
    }
    
    private func makeApple(price: Float = 1.0) -> Item {
        Item(name: "Apple", price: price)
    }
    
    private func makeBanana(price: Float = 1.0) -> Item {
        Item(name: "Banana", price: price)
    }

}
