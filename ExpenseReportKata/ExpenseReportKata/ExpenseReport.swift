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
    
    func getAmount() -> Int
}

class Breakfast: ExpenseProtocol {
    private let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    var marker: String { amount > 1000 ? "X" : " " }
    
    var name: String { "Breakfast" }
    
    func getAmount() -> Int { amount }
}

class Dinner: ExpenseProtocol {
    private let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }

    var marker: String { amount > 5000 ? "X" : " " }
    
    var name: String { "Dinner" }
    
    func getAmount() -> Int { amount }
}

class CarRental: ExpenseProtocol {
    private let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }

    var marker: String { " " }
    
    var name: String { "Car Rental" }
    
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
            switch expense.type {
            case .breakfast:
                let breakfast = ExpenseFactory.createExpense(type: .breakfast, amount: expense.amount)
                
                printMessage("\(breakfast.name)\t\(breakfast.getAmount())\t\(breakfast.marker)")
                mealExpenses += breakfast.getAmount()
                total += breakfast.getAmount()
            case .dinner:
                let dinner = ExpenseFactory.createExpense(type: .dinner, amount: expense.amount)

                printMessage("\(dinner.name)\t\(dinner.getAmount())\t\(dinner.marker)")
                mealExpenses += dinner.getAmount()
                total += dinner.getAmount()
            case .carRental:
                let carRental = ExpenseFactory.createExpense(type: .carRental, amount: expense.amount)
                printMessage("\(carRental.name)\t\(carRental.getAmount())\t\(carRental.marker)")
                total += expense.amount
            }
        }
        
        printMessage("Meal Expenses: \(mealExpenses)")
        printMessage("Total Expenses: \(total)")
    }
    
    func printMessage(_ message: String) {
        print(message)
    }
}
