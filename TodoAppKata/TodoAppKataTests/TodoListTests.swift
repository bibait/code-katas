import Testing
import Foundation
import TodoAppKata

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
    func removeTodo_updatesItems_withRemovedItem() throws {
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
    
    @Test
    func removeTodo_withFailingOperation_throwsError() throws {
        let todo = makeTodoItem(id: .init())
        let (sut, repository) = makeSUT(items: [todo])
        repository.stub(error: error)

        #expect(throws: error) {
            try sut.remove(todo)
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

}
