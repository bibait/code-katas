public class TodoList {
    private let repository: TodoItemRepository
    private var _todos: [TodoItem] = []

    public init(repository: TodoItemRepository) {
        self.repository = repository
        _todos = repository.fetchAllItems()
    }
    
    public var todos: [TodoItem] { _todos }
    
    public func add(_ todo: TodoItem) throws {
        try execute {
            try repository.save(todo)
            _todos.append(todo)
        }
    }
    
    public func remove(_ todo: TodoItem) throws {
        try execute {
            try repository.remove(todo)
            _todos.removeAll { $0.id == todo.id }
        }
    }
    
    public func toggleCompleted(_ todo: TodoItem) throws {
        try! repository.update(todo.toggleCompleted())
        if let index = _todos.firstIndex(where: { $0.id == todo.id }) {
            _todos[index] = todo.toggleCompleted()
        }
    }
    
    private func execute(action: () throws -> Void) throws {
        do {
            try action()
        } catch {
            throw error
        }
    }
}
