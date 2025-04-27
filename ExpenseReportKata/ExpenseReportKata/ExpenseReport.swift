import Foundation

enum ExpenseType {
    case breakfast
    case dinner
    case carRental
}

struct Expense {
    var type: ExpenseType
    var amount: Int
}

protocol ExpenseProtocol {
    var marker: String { get }
    var name: String { get }
    var isMeal: Bool { get }

    func getAmount() -> Int
}

class Breakfast: ExpenseProtocol {
    private let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    var marker: String { amount > 1000 ? "X" : " " }
    
    var name: String { "Breakfast" }
    
    var isMeal: Bool { true }
    
    func getAmount() -> Int { amount }
}

class Dinner: ExpenseProtocol {
    private let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }

    var marker: String { amount > 5000 ? "X" : " " }
    
    var name: String { "Dinner" }
    
    var isMeal: Bool { true }
    
    func getAmount() -> Int { amount }
}

class CarRental: ExpenseProtocol {
    private let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }

    var marker: String { " " }
    
    var name: String { "Car Rental" }
    
    var isMeal: Bool { false }
    
    func getAmount() -> Int { amount }
}

class ExpenseFactory {
    static func createExpense(type: ExpenseType, amount: Int) -> ExpenseProtocol {
        switch type {
        case .breakfast:
            Breakfast(amount: amount)
        
        case .dinner:
            Dinner(amount: amount)
        
        case .carRental:
            CarRental(amount: amount)
        }
    }
}

class ExpenseReport {
    private let getDate: () -> Date
    
    init(
        getDate: @escaping () -> Date = { Date() }
    ) {
        self.getDate = getDate
    }

    func printReport(expenses: [Expense]) {
        var mealExpenses = 0
        var total = 0
        
        printMessage("Expense Report \(getDate())")
        
        for expense in expenses {
            let expense = ExpenseFactory.createExpense(type: expense.type, amount: expense.amount)
            
            printMessage("\(expense.name)\t\(expense.getAmount())\t\(expense.marker)")
            mealExpenses += expense.isMeal ? expense.getAmount() : 0
            total += expense.getAmount()
        }
        
        printMessage("Meal Expenses: \(mealExpenses)")
        printMessage("Total Expenses: \(total)")
    }
    
    func printMessage(_ message: String) {
        print(message)
    }
}
