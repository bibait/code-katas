import Foundation

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

protocol MessagePrinter {
    func printMessage(_ message: String)
}

struct Expenses {
    let expenseList: [Expense]
    
    func getMealExpenses() -> Int {
        expenseList
            .filter { $0.isMeal }
            .reduce(0) { $0 + $1.amount }
    }
    
    func getTotal() -> Int {
        expenseList
            .reduce(0) { $0 + $1.amount }
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

    func printReport(expenses: Expenses) {
        printer.printMessage("Expense Report \(getDate())")
        
        for expense in expenses.expenseList {
            printSingleExpense(expense)
        }

        printer.printMessage("Meal Expenses: \(expenses.getMealExpenses())")
        printer.printMessage("Total Expenses: \(expenses.getTotal())")
    }
    
    private func printSingleExpense(_ expense: Expense) {
        printer.printMessage("\(expense.name)\t\(expense.amount)\t\(expense.isOverLimit ? "X" : " ")")
    }
}
