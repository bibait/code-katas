import Foundation

public struct TodoItem: Equatable {
    public let id: UUID
    public let title: String
    public let isCompleted: Bool
    
    public init(
        id: UUID,
        title: String,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    public func toggleCompleted() -> TodoItem {
        TodoItem(
            id: id,
            title: title,
            isCompleted: !isCompleted
        )
    }
}
