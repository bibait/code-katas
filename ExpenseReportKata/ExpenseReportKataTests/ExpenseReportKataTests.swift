import Testing
import Foundation
import ApprovalTests_Swift
@testable import ExpenseReportKata

struct ExpenseReportKataTests {

    @Test
    func testPrintReport() throws {
        let amounts: [Int] = [
            0, 4999, 5000, 5001, 999, 1000, 1001, 2000, 2001
        ]
        
        let types: [ExpenseType] = [
            .breakfast,
            .carRental,
            .dinner,
            .lunch
        ]

        let printer = SpyMessagePrinter()
        let sut = ExpenseReport(getDate: { date() }, messagePrinter: printer)
        
        try CombinationApprovals.verifyAllCombinations({ amounts, types in
            let expense = Expense(type: types, amount: amounts)
            sut.printReport(expenses: [expense])
            return printer.messages
        }, amounts, types)
    }
    
    @Test
    func testPrintReport_lunch() throws {
        let expense = Expense(type: .lunch, amount: 2001)

        let printer = SpyMessagePrinter()
        let sut = ExpenseReport(getDate: { date() }, messagePrinter: printer)
        
        sut.printReport(expenses: [expense])
        
        #expect(printer.messages == [
            "Expense Report \(date())",
            "Lunch\t2001\tX",
            "Meal Expenses: 2001",
            "Total Expenses: 2001"
        ])
    }
    
    @Test
    func testPrintReport_lunchBelowLimit() throws {
        let expense = Expense(type: .lunch, amount: 2000)

        let printer = SpyMessagePrinter()
        let sut = ExpenseReport(getDate: { date() }, messagePrinter: printer)
        
        sut.printReport(expenses: [expense])
        
        #expect(printer.messages == [
            "Expense Report \(date())",
            "Lunch\t2000\t ",
            "Meal Expenses: 2000",
            "Total Expenses: 2000"
        ])
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
