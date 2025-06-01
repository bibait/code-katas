import Testing
import ShoppingBasketDiscountKata

struct ShoppingBasketDiscountKataTests {
    
    @Test
    func addItem() {
        let sut = makeSUT(items: [])
        
        sut.addItem(makeApple(), quantity: 2)
        sut.addItem(makeBanana())
        
        #expect(sut.getItemQuantity(name: "Apple") == 2)
        #expect(sut.getItemQuantity(name: "Banana") == 1)
    }
    
    @Test
    func removeItem() {
        let sut = makeSUT(items: [
            makeApple(),
            makeApple(),
            makeApple(),
        ])
        
        sut.removeItem("Apple", quantity: 2)
        
        #expect(sut.getItemQuantity(name: "Apple") == 1)
    }

    @Test
    func getItemQuantity_shouldReturnCount() {
        let sut = makeSUT(items: [
            makeApple(),
            makeApple(),
            makeBanana(),
        ])
        
        #expect(sut.getItemQuantity(name: "Apple") == 2)
        #expect(sut.getItemQuantity(name: "Banana") == 1)
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
    
    @Test
    func appliesTenPercentDiscount_forBasketValue_greaterThan200() {
        let sut = makeSUT(items: [
            makeApple(price: 200),
            makeBanana(price: 50),
        ])
        
        let result = sut.calculateTotalPrice()
        
        #expect(result == 225)
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
