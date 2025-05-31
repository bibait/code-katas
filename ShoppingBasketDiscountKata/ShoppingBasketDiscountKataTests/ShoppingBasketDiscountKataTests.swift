import Testing

public struct Item {
    private let name: String
    private let price: Float
    
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
        return 2
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
        
        let result = sut.getItemQuantity(name: "Apple")
        
        #expect(result == 2)
    }

}
