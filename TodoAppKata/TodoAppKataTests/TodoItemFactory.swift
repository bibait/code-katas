import Foundation
import TodoAppKata

class TodoItemFactory {
    static func makeTodoItem(
        id: UUID,
        title: String = "Any"
    ) -> TodoItem {
        TodoItem(id: id, title: title)
    }
}
