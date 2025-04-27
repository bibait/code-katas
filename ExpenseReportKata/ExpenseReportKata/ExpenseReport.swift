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
            if (expense.type == .dinner || expense.type == .breakfast) {
                mealExpenses += expense.amount
            }

            var expenseName = ""
            switch expense.type {
            case .breakfast: expenseName = "Breakfast"
            case .dinner: expenseName = "Dinner"
            case .carRental: expenseName = "Car Rental"
            }

            let mealOverExpensesMarker = expense.type == .dinner && expense.amount > 5000 || expense.type == .breakfast && expense.amount > 1000 ? "X" : " "
            
            printMessage("\(expenseName)\t\(expense.amount)\t\(mealOverExpensesMarker)")

            total += expense.amount
        }
        
        printMessage("Meal Expenses: \(mealExpenses)")
        printMessage("Total Expenses: \(total)")
    }
    
    func printMessage(_ message: String) {
        print(message)
    }
}
