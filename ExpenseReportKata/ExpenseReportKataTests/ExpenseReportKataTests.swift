import Testing
import Foundation
@testable import ExpenseReportKata

struct ExpenseReportKataTests {

    @Test
    func testPrintReport() {
        let sut = TestableSut {
            date()
        }
        
        sut.printReport(expenses: [])
        
        #expect(sut.messages == [
            "Expense Report 2025-06-15 10:00:00 +0000",
            "Meal Expenses: 0",
            "Total Expenses: 0",
        ])
    }
    
    // MARK: - Helpers
    
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
