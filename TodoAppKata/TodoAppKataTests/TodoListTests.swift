import Testing
import TodoAppKata

public protocol TodoItemRepository {
    func save(_ todo: TodoItem)
    func fetchAllItems() -> [TodoItem]
}

public class TodoList {
    private let repository: TodoItemRepository
    private var _todos: [TodoItem] = []

    public init(repository: TodoItemRepository) {
        self.repository = repository
        _todos = repository.fetchAllItems()
    }
    
    public var todos: [TodoItem] { _todos }
    
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
    func init_fetchesItemsFromRepository() {
        let todoItem = makeTodoItem(title: "Todo 1")
        let (sut, _) = makeSUT(items: [todoItem])
        
        #expect(sut.todos == [todoItem])
    }

    @Test
    func addTodo_updatesItems_withNewItem() {
        let (sut, _) = makeSUT()
        let newTodo = makeTodoItem(title: "New Todo")
        
        sut.add(newTodo)
        
        #expect(sut.todos == [newTodo])
    }
    
    @Test
    func addTodo_persistsInRepository() {
        let (sut, repository) = makeSUT()
        let newTodo = makeTodoItem(title: "New Todo")
        
        sut.add(newTodo)
        
        #expect(repository.savedTodos == [newTodo])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(
        items: [TodoItem] = []
    ) -> (
        sut: TodoList,
        repository: FakeRepository
    ) {
        let repository = FakeRepository()
        repository.stub(items: items)
        let sut = TodoList(repository: repository)
        
        return (sut, repository)
    }
    
    private func makeTodoItem(title: String = "Any") -> TodoItem {
        TodoItem(title: title)
    }
    
    private class FakeRepository: TodoItemRepository {
        private(set) var savedTodos: [TodoItem] = []

        func save(_ todo: TodoItem) {
            savedTodos.append(todo)
        }
        
        func fetchAllItems() -> [TodoItem] {
            savedTodos
        }
        
        func stub(items: [TodoItem]) {
            savedTodos = items
        }
    }

}
