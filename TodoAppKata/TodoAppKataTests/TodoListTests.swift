import Testing
import Foundation
import TodoAppKata

public protocol TodoItemRepository {
    func save(_ todo: TodoItem) throws
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
    
    public func add(_ todo: TodoItem) throws {
        do {
            try repository.save(todo)
            _todos.append(todo)
        } catch {}
    }
}

public struct TodoItem: Equatable {
    public let id: UUID
    public let title: String
    
    public init(id: UUID, title: String) {
        self.id = id
        self.title = title
    }
}

struct TodoListTests {
    
    @Test
    func init_fetchesItemsFromRepository() {
        let todoItem = makeTodoItem(id: .init())
        let (sut, _) = makeSUT(items: [todoItem])
        
        #expect(sut.todos == [todoItem])
    }

    @Test
    func addTodo_updatesItems_withNewItem() throws {
        let (sut, _) = makeSUT()
        let newTodo = makeTodoItem(id: .init())
        
        try! sut.add(newTodo)
        
        #expect(sut.todos == [newTodo])
    }
    
    @Test
    func addTodo_withFailingOperation_doesNotAddNewItem() throws {
        let (sut, repository) = makeSUT()
        let newTodo = makeTodoItem(id: .init())
        repository.stub(error: NSError(domain: "Test", code: -1))

        try! sut.add(newTodo)
        
        #expect(repository.savedTodos.isEmpty)
    }
    
    @Test
    func addTodo_persistsInRepository() throws {
        let (sut, _) = makeSUT()
        let newTodo = makeTodoItem(id: .init())
        
        try! sut.add(newTodo)
        
        #expect(sut.todos == [newTodo])
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
    
    private func makeTodoItem(
        id: UUID,
        title: String = "Any"
    ) -> TodoItem {
        TodoItem(id: id, title: title)
    }
    
    private class FakeRepository: TodoItemRepository {
        private(set) var savedTodos: [TodoItem] = []
        private(set) var error: Error?

        func save(_ todo: TodoItem) throws {
            if let error = error {
                throw error
            }

            savedTodos.append(todo)
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

}
