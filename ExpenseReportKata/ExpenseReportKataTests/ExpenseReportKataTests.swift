import Testing
@testable import ExpenseReportKata

struct ExpenseReportKataTests {

    @Test
    func testPrintReport() throws {
        
    }
    
    // MARK: - Helpers
    
    private class TestableSut: ExpenseReport {
        var messages: [String] = []

        override func printMessage(_ message: String) {
            messages.append(message)
        }
    }

}
