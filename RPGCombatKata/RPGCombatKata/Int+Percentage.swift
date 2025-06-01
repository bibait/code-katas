extension Int {
    func increaseBy(percentage: Int) -> Int {
        self + (self * percentage / 100)
    }
    
    func decreaseBy(percentage: Int) -> Int {
        self - (self * percentage / 100)
    }
}
