import Testing
import Foundation
import TodoAppKata

struct TodoListTests {
    private let error = NSError(domain: "Test", code: -1)
    private let id = UUID(uuidString: "B1495D7E-B662-4BA2-89CB-BAAD9D3D29B3")!
    
    private var todoItem: TodoItem {
        TodoItemFactory.makeTodoItem(id: id)
    }
    
    @Test
    func init_fetchesItemsFromRepository() {
        let (sut, _) = makeSUT(items: [todoItem])
        
        #expect(sut.todos == [todoItem])
    }

    @Test
    func addTodo_updatesItems_withNewItem() throws {
        let (sut, repository) = makeSUT()
        
        addWithNonFailingOperation(sut: sut, newTodo: todoItem)
        
        #expect(sut.todos == [todoItem])
        #expect(repository.savedTodos == [todoItem])
    }
    
    @Test
    func addTodo_withFailingOperation_doesNotAddNewItem() throws {
        let (sut, repository) = makeSUT()
        repository.stub(error: error)

        try? sut.add(todoItem)
        
        #expect(repository.savedTodos.isEmpty)
        #expect(sut.todos.isEmpty)
    }
    
    @Test
    func addTodo_withFailingOperation_throwsError() throws {
        let (sut, repository) = makeSUT()
        repository.stub(error: error)

        #expect(throws: error) {
            try sut.add(todoItem)
        }
    }
    
    @Test
    func removeTodo_updatesItems_withRemovedItem() throws {
        let (sut, repository) = makeSUT(items: [todoItem])
        
        #expect(throws: Never.self) {
            try sut.remove(todoItem)
        }
        
        #expect(sut.todos.isEmpty)
        #expect(repository.removedTodos == [todoItem])
    }
    
    @Test
    func removeTodo_withFailingOperation_doesNotRemoveItem() throws {
        let (sut, repository) = makeSUT(items: [todoItem])
        repository.stub(error: error)

        try? sut.remove(todoItem)
        
        #expect(repository.removedTodos.isEmpty)
        #expect(sut.todos == [todoItem])
    }
    
    @Test
    func removeTodo_withFailingOperation_throwsError() throws {
        let (sut, repository) = makeSUT(items: [todoItem])
        repository.stub(error: error)

        #expect(throws: error) {
            try sut.remove(todoItem)
        }
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
    
    private func addWithNonFailingOperation(sut: TodoList, newTodo: TodoItem) {
        #expect(throws: Never.self) {
            try sut.add(newTodo)
        }
    }

}
