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
    var amount: Int { get }
}

class Breakfast: ExpenseProtocol {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }
    
    var marker: String { amount > 1000 ? "X" : " " }
    var name: String { "Breakfast" }
    var isMeal: Bool { true }
    var amount: Int { _amount }
}

class Dinner: ExpenseProtocol {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }

    var marker: String { amount > 5000 ? "X" : " " }
    var name: String { "Dinner" }
    var isMeal: Bool { true }
    var amount: Int { _amount }
}

class CarRental: ExpenseProtocol {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }

    var marker: String { " " }
    var name: String { "Car Rental" }
    var isMeal: Bool { false }
    var amount: Int { _amount }
}

class ExpenseFactory {
    static func createExpense(type: ExpenseType, amount: Int) -> ExpenseProtocol {
        switch type {
        case .breakfast: Breakfast(amount: amount)
        case .dinner: Dinner(amount: amount)
        case .carRental: CarRental(amount: amount)
        }
    }
}

protocol MessagePrinter {
    func printMessage(_ message: String)
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
            
            printMessage("\(expense.name)\t\(expense.amount)\t\(expense.marker)")
            mealExpenses += expense.isMeal ? expense.amount : 0
            total += expense.amount
        }
        
        printMessage("Meal Expenses: \(mealExpenses)")
        printMessage("Total Expenses: \(total)")
    }
    
    func printMessage(_ message: String) {
        print(message)
    }
}
