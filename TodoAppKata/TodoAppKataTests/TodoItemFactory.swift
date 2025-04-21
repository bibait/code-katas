import Foundation
import TodoAppKata

class TodoItemFactory {
    static func makeTodoItem(
        id: UUID,
        isCompleted: Bool
    ) -> TodoItem {
        TodoItem(
            id: id,
            title: "Any",
            isCompleted: isCompleted
        )
    }
}
