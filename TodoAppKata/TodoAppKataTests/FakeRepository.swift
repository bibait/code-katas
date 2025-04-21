import TodoAppKata

class FakeRepository: TodoItemRepository {
    private(set) var savedTodos: [TodoItem] = []
    private(set) var removedTodos: [TodoItem] = []
    private(set) var updatedTodos: [TodoItem] = []
    private(set) var error: Error?

    func save(_ todo: TodoItem) throws {
        if let error = error {
            throw error
        }

        savedTodos.append(todo)
    }
    
    func remove(_ todo: TodoItem) throws {
        if let error = error {
            throw error
        }

        removedTodos.append(todo)
    }
    
    func update(_ todo: TodoItem) throws {
        if let error = error {
            throw error
        }
        
        updatedTodos.append(todo)
    }
    
    func fetchAllItems() -> [TodoItem] {
        savedTodos
    }
    
    func stub(items: [TodoItem]) {
        savedTodos = items
    }
    
    func stub(error: Error) {
        self.error = error
    }
}
