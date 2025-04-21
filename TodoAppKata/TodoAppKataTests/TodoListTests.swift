import Testing
import TodoAppKata

public protocol TodoItemRepository {
    func save(_ todo: TodoItem)
}

public class TodoList {
    private let repository: TodoItemRepository
    private var _todos: [TodoItem] = []

    public init(repository: TodoItemRepository) {
        self.repository = repository
    }
    
    public var todos: [TodoItem] {
        _todos
    }
    
    public func add(_ todo: TodoItem) {
        repository.save(todo)
        _todos.append(todo)
    }
}

public struct TodoItem: Equatable {
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
}

struct TodoListTests {

    @Test
    func addTodo() {
        let sut = TodoList(repository: FakeRepository())
        let newTodo = TodoItem(title: "New Todo")
        
        sut.add(newTodo)
        
        #expect(sut.todos == [newTodo])
    }
    
    @Test
    func addTodo_persistsInRepository() {
        let repository = FakeRepository()
        let sut = TodoList(repository: repository)
        let newTodo = TodoItem(title: "New Todo")
        
        sut.add(newTodo)
        
        #expect(repository.savedTodos == [newTodo])
    }
    
    // MARK: - Helpers
    
    private class FakeRepository: TodoItemRepository {
        private(set) var savedTodos: [TodoItem] = []

        func save(_ todo: TodoItem) {
            savedTodos.append(todo)
        }
    }

}
