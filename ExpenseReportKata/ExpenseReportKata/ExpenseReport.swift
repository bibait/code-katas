import Foundation

enum ExpenseType {
    case breakfast
    case dinner
    case carRental
    case lunch
}

struct Expense {
    var type: ExpenseType
    var amount: Int
}

protocol ExpenseProtocol {
    var name: String { get }
    var isMeal: Bool { get }
    var amount: Int { get }
    var isOverLimit: Bool { get }
}

class Breakfast: ExpenseProtocol {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }
    
    var name: String { "Breakfast" }
    var isMeal: Bool { true }
    var amount: Int { _amount }
    var isOverLimit: Bool { amount > 1000 }
}

class Dinner: ExpenseProtocol {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }

    var name: String { "Dinner" }
    var isMeal: Bool { true }
    var amount: Int { _amount }
    var isOverLimit: Bool { amount > 5000 }
}

class Lunch: ExpenseProtocol {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }

    var name: String { "Lunch" }
    var isMeal: Bool { true }
    var amount: Int { _amount }
    var isOverLimit: Bool { amount > 2000 }
}

class CarRental: ExpenseProtocol {
    private let _amount: Int
    
    init(amount: Int) { _amount = amount }

    var name: String { "Car Rental" }
    var isMeal: Bool { false }
    var amount: Int { _amount }
    var isOverLimit: Bool { false }
}

class ExpenseFactory {
    static func createExpense(type: ExpenseType, amount: Int) -> ExpenseProtocol {
        switch type {
        case .breakfast: Breakfast(amount: amount)
        case .dinner: Dinner(amount: amount)
        case .carRental: CarRental(amount: amount)
        case .lunch: Lunch(amount: amount)
        }
    }
}

protocol MessagePrinter {
    func printMessage(_ message: String)
}

struct Expenses {
    let expenseList: [ExpenseProtocol]
    
    func getMealExpenses() -> Int {
        var result = 0

        for expense in expenseList {
            guard expense.isMeal else { continue }
            
            result += expense.amount
        }
        
        return result
    }
    
    func getTotal() -> Int {
        var result = 0

        for expense in expenseList {
            result += expense.amount
        }
        
        return result
    }
}

class ExpenseReport {
    private let getDate: () -> Date
    private let printer: MessagePrinter

    init(
        getDate: @escaping () -> Date = { Date() },
        messagePrinter: MessagePrinter
    ) {
        self.getDate = getDate
        self.printer = messagePrinter
    }

    func printReport(expenses: [Expense]) {
        var expensesList = Expenses(expenseList: expenses.map { ExpenseFactory.createExpense(type: $0.type, amount: $0.amount) })

        var mealExpenses = 0
        var total = 0
        
        printer.printMessage("Expense Report \(getDate())")
        
        for expense in expenses {
            let expense = ExpenseFactory.createExpense(type: expense.type, amount: expense.amount)
            
            printer.printMessage("\(expense.name)\t\(expense.amount)\t\(expense.isOverLimit ? "X" : " ")")
        }
        
        for expense in expenses {
            let expense = ExpenseFactory.createExpense(type: expense.type, amount: expense.amount)
            
            mealExpenses += expense.isMeal ? expense.amount : 0
        }
        
        for expense in expenses {
            let expense = ExpenseFactory.createExpense(type: expense.type, amount: expense.amount)
            
            total += expense.amount
        }
        
        printer.printMessage("Meal Expenses: \(mealExpenses)")
        printer.printMessage("Total Expenses: \(total)")
    }
}
