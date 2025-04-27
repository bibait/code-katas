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
            var expenseName = ""
            var mealOverExpensesMarker = " "

            switch expense.type {
            case .breakfast:
                mealExpenses += expense.amount
                expenseName = "Breakfast"
                mealOverExpensesMarker = expense.amount > 1000 ? "X" : " "
                break
            case .dinner:
                mealExpenses += expense.amount
                expenseName = "Dinner"
                mealOverExpensesMarker = expense.amount > 5000 ? "X" : " "
                break
            case .carRental:
                expenseName = "Car Rental"
                break
            }
            
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
