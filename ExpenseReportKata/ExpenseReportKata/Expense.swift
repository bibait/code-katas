protocol Expense {
    var name: String { get }
    var isMeal: Bool { get }
    var amount: Int { get }
    var isOverLimit: Bool { get }
}

class Breakfast: Expense {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }
    
    var name: String { "Breakfast" }
    var isMeal: Bool { true }
    var amount: Int { _amount }
    var isOverLimit: Bool { amount > 1000 }
}

class Dinner: Expense {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }

    var name: String { "Dinner" }
    var isMeal: Bool { true }
    var amount: Int { _amount }
    var isOverLimit: Bool { amount > 5000 }
}

class Lunch: Expense {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }

    var name: String { "Lunch" }
    var isMeal: Bool { true }
    var amount: Int { _amount }
    var isOverLimit: Bool { amount > 2000 }
}

class CarRental: Expense {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }

    var name: String { "Car Rental" }
    var isMeal: Bool { false }
    var amount: Int { _amount }
    var isOverLimit: Bool { false }
}
