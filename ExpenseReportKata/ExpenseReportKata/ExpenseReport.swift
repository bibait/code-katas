import Foundation

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
