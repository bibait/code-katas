import Testing
import Foundation
import ApprovalTests_Swift
@testable import ExpenseReportKata

struct ExpenseReportKataTests {

    @Test
    func testPrintReport() throws {
        let amounts: [Int] = [
            0, 4999, 5000, 5001, 999, 1000, 1001
        ]
        
        let types: [ExpenseType] = [
            .breakfast,
            .carRental,
            .dinner,
        ]

        let printer = SpyMessagePrinter()
        let sut = ExpenseReport(getDate: { date() }, messagePrinter: printer)
        
        try CombinationApprovals.verifyAllCombinations({ amounts, types in
            let expense = Expense(type: types, amount: amounts)
            sut.printReport(expenses: [expense])
            return printer.messages
        }, amounts, types)
    }
    
    // MARK: - Helpers
    
    private class SpyMessagePrinter: MessagePrinter {
        var messages: [String] = []
        
        func printMessage(_ message: String) {
            messages.append(message)
        }
    }
    
    private class TestableSut: ExpenseReport {
        var messages: [String] = []

        override func printMessage(_ message: String) {
            messages.append(message)
        }
    }
    
    private func date() -> Date {
        let calendar = Calendar.current
        let components = DateComponents(year: 2025, month: 6, day: 15, hour: 12)
        return calendar.date(from: components)!
    }

}
