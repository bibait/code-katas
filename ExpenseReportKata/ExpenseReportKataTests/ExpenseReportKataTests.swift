import Testing
import Foundation
import ApprovalTests_Swift
@testable import ExpenseReportKata

struct ExpenseReportKataTests {

    @Test
    func testPrintReport() throws {
        let expenses: [Expenses] = [
            Expenses(expenseList: [
                Breakfast(amount: 0),
                Dinner(amount: 0),
                Lunch(amount: 0),
                CarRental(amount: 0)
            ]),
            Expenses(expenseList: [
                Breakfast(amount: 1000),
                Dinner(amount: 5000),
                Lunch(amount: 2000),
                CarRental(amount: 999)
            ]),
            Expenses(expenseList: [
                Breakfast(amount: 1001),
                Dinner(amount: 5001),
                Lunch(amount: 2001),
                CarRental(amount: 2001)
            ])
        ]

        let printer = SpyMessagePrinter()
        let sut = ExpenseReport(getDate: { date() }, messagePrinter: printer)
        
        try CombinationApprovals.verifyAllCombinations({ expenses in
            sut.printReport(expenses: expenses)
            return printer.messages
        }, expenses)
    }
    
    // MARK: - Helpers
    
    private class SpyMessagePrinter: MessagePrinter {
        var messages: [String] = []
        
        func printMessage(_ message: String) {
            messages.append(message)
        }
    }
    
    private func date() -> Date {
        let calendar = Calendar.current
        let components = DateComponents(year: 2025, month: 6, day: 15, hour: 12)
        return calendar.date(from: components)!
    }

}
