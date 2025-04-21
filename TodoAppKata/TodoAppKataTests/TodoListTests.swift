import Testing
import Foundation
import TodoAppKata

public protocol TodoItemRepository {
    func save(_ todo: TodoItem) throws
    func remove(_ todo: TodoItem) throws
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
        } catch {
            throw error
        }
    }
    
    public func remove(_ todo: TodoItem) throws {
        do {
            try repository.remove(todo)
            _todos.removeAll { $0.id == todo.id }
        } catch {
            
        }
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
    private let error = NSError(domain: "Test", code: -1)
    
    @Test
    func init_fetchesItemsFromRepository() {
        let todoItem = makeTodoItem(id: .init())
        let (sut, _) = makeSUT(items: [todoItem])
        
        #expect(sut.todos == [todoItem])
    }

    @Test
    func addTodo_updatesItems_withNewItem() throws {
        let (sut, repository) = makeSUT()
        let newTodo = makeTodoItem(id: .init())
        
        addWithNonFailingOperation(sut: sut, newTodo: newTodo)
        
        #expect(sut.todos == [newTodo])
        #expect(repository.savedTodos == [newTodo])
    }
    
    @Test
    func addTodo_withFailingOperation_doesNotAddNewItem() throws {
        let (sut, repository) = makeSUT()
        let newTodo = makeTodoItem(id: .init())
        repository.stub(error: error)

        try? sut.add(newTodo)
        
        #expect(repository.savedTodos.isEmpty)
        #expect(sut.todos.isEmpty)
    }
    
    @Test
    func addTodo_withFailingOperation_throwsError() throws {
        let (sut, repository) = makeSUT()
        let newTodo = makeTodoItem(id: .init())
        repository.stub(error: error)

        #expect(throws: error) {
            try sut.add(newTodo)
        }
    }
    
    @Test
    func deleteTodo_updatesItems_withRemovedItem() throws {
        let todo = makeTodoItem(id: .init())
        let (sut, repository) = makeSUT(items: [todo])
        
        #expect(throws: Never.self) {
            try sut.remove(todo)
        }
        
        #expect(sut.todos.isEmpty)
        #expect(repository.removedTodos == [todo])
    }
    
    @Test
    func removeTodo_withFailingOperation_doesNotRemoveItem() throws {
        let todo = makeTodoItem(id: .init())
        let (sut, repository) = makeSUT(items: [todo])
        repository.stub(error: error)

        try? sut.remove(todo)
        
        #expect(repository.removedTodos.isEmpty)
        #expect(sut.todos == [todo])
    }
    
//    @Test
//    func addTodo_withFailingOperation_throwsError() throws {
//        let (sut, repository) = makeSUT()
//        let newTodo = makeTodoItem(id: .init())
//        repository.stub(error: error)
//
//        #expect(throws: error) {
//            try sut.add(newTodo)
//        }
//    }
    
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
    
    private func addWithNonFailingOperation(sut: TodoList, newTodo: TodoItem) {
        #expect(throws: Never.self) {
            try sut.add(newTodo)
        }
    }
    
    private class FakeRepository: TodoItemRepository {
        private(set) var savedTodos: [TodoItem] = []
        private(set) var removedTodos: [TodoItem] = []
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
