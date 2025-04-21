import Testing
import Foundation
import TodoAppKata

struct TodoListTests {
    private let error = NSError(domain: "Test", code: -1)
    private let id = UUID(uuidString: "B1495D7E-B662-4BA2-89CB-BAAD9D3D29B3")!
    
    private var todoItem: TodoItem {
        TodoItemFactory.makeTodoItem(
            id: id,
            isCompleted: false
        )
    }
    
    @Test
    func init_fetchesItemsFromRepository() {
        let (sut, _) = makeSUT(items: [todoItem])
        
        #expect(sut.todos == [todoItem])
    }

    @Test
    func addTodo_updatesItems_withNewItem() throws {
        let (sut, repository) = makeSUT()
        
        executeNonThrowingAction {
            try sut.add(todoItem)
        }
        
        #expect(sut.todos == [todoItem])
        #expect(repository.savedTodos == [todoItem])
    }
    
    @Test
    func addTodo_withFailingOperation_doesNotAddNewItem() throws {
        let (sut, repository) = makeSUT(error: error)

        try? sut.add(todoItem)
        
        #expect(repository.savedTodos.isEmpty)
        #expect(sut.todos.isEmpty)
    }
    
    @Test
    func addTodo_withFailingOperation_throwsError() throws {
        let (sut, _) = makeSUT(error: error)

        expectError {
            try sut.add(todoItem)
        }
    }
    
    @Test
    func removeTodo_updatesItems_withRemovedItem() throws {
        let (sut, repository) = makeSUT(items: [todoItem])
        
        executeNonThrowingAction {
            try sut.remove(todoItem)
        }
        
        #expect(sut.todos.isEmpty)
        #expect(repository.removedTodos == [todoItem])
    }
    
    @Test
    func removeTodo_withFailingOperation_doesNotRemoveItem() throws {
        let (sut, repository) = makeSUT(items: [todoItem], error: error)

        try? sut.remove(todoItem)
        
        #expect(repository.removedTodos.isEmpty)
        #expect(sut.todos == [todoItem])
    }
    
    @Test
    func removeTodo_withFailingOperation_throwsError() throws {
        let (sut, _) = makeSUT(items: [todoItem], error: error)

        expectError {
            try sut.remove(todoItem)
        }
    }
    
    @Test
    func toggleCompleted_updatesItems_withToggledItem() throws {
        let (sut, repository) = makeSUT(items: [todoItem])
        
        executeNonThrowingAction {
            try sut.toggleCompleted(todoItem)
        }
        
        #expect(sut.todos == [todoItem.toggleCompleted()])
        #expect(repository.updatedTodos == [todoItem.toggleCompleted()])
    }
    
    @Test
    func toggleCompleted_withFailingOperation_doesNotUpdate() throws {
        let (sut, repository) = makeSUT(items: [todoItem], error: error)

        try? sut.toggleCompleted(todoItem)
        
        #expect(repository.updatedTodos.isEmpty)
        #expect(sut.todos == [todoItem])
    }
    
    @Test
    func toggleCompleted_withFailingOperation_throwsError() throws {
        let (sut, _) = makeSUT(items: [todoItem], error: error)

        expectError {
            try sut.toggleCompleted(todoItem)
        }
    }
    
    // MARK: - Helpers
    
    private func makeSUT(
        items: [TodoItem] = [],
        error: Error? = nil
    ) -> (
        sut: TodoList,
        repository: FakeRepository
    ) {
        let repository = FakeRepository()
        if let error = error {
            repository.stub(error: error)
        }
        repository.stub(items: items)

        let sut = TodoList(repository: repository)
        
        return (sut, repository)
    }
    
    private func executeNonThrowingAction(_ action: () throws -> Void) {
        #expect(throws: Never.self) {
            try action()
        }
    }
    
    private func expectError(when action: () throws -> Void) {
        #expect(throws: error) {
            try action()
        }
    }

}
