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
        items
            .reduce(0) { $0 + $1.price }
    }
}

struct ShoppingBasketDiscountKataTests {

    @Test
    func getItemQuantity_shouldReturnCount() {
        let sut = ShoppingBasket(items: [
            Item(name: "Apple", price: 1.0),
            Item(name: "Apple", price: 1.0),
            Item(name: "Banana", price: 1.0),
        ])
        
        var result = sut.getItemQuantity(name: "Apple")
        #expect(result == 2)
        
        result = sut.getItemQuantity(name: "Banana")
        #expect(result == 1)
    }
    
    @Test
    func calculateTotalPrice() {
        let sut = ShoppingBasket(items: [
            getApple(),
            getApple(),
            getBanana(),
        ])
        
        let result = sut.calculateTotalPrice()
        
        #expect(result == 3.0)
    }
    
    // MARK: - Helpers
    
    private func getApple(price: Float = 1.0) -> Item {
        Item(name: "Apple", price: price)
    }
    
    private func getBanana(price: Float = 1.0) -> Item {
        Item(name: "Banana", price: price)
    }

}
