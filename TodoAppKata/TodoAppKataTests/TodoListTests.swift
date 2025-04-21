import Testing
import TodoAppKata

public class TodoList {
    private var _todos: [TodoItem] = []

    public init() {}
    
    public var todos: [TodoItem] {
        _todos
    }
    
    public func add(_ todo: TodoItem) {
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
        let sut = TodoList()
        let newTodo = TodoItem(title: "New Todo")
        
        sut.add(newTodo)
        
        #expect(sut.todos == [newTodo])
    }

}
