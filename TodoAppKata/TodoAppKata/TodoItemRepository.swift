public protocol TodoItemRepository {
    func save(_ todo: TodoItem) throws
    func remove(_ todo: TodoItem) throws
    func fetchAllItems() -> [TodoItem]
}
