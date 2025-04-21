import Foundation
import TodoAppKata

class TodoItemFactory {
    static func makeTodoItem(
        id: UUID,
        title: String = "Any",
        isCompleted: Bool
    ) -> TodoItem {
        TodoItem(
            id: id,
            title: title,
            isCompleted: isCompleted
        )
    }
}
