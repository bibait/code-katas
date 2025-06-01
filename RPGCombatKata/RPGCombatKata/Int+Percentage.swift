extension Int {
    func increased(byPercentage: Int) -> Int {
        self + (self * byPercentage / 100)
    }
    
    func decreased(byPercentage: Int) -> Int {
        self - (self * byPercentage / 100)
    }
}
