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
