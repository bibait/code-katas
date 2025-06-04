import Foundation

@Observable
class HeightAdjustableDeskViewModel {
    private let desk: HeightAdjustableDesk
    
    var currentHeight: String

    init(desk: HeightAdjustableDesk) {
        self.desk = desk
        self.currentHeight = String(format: "%.0f cm", desk.height)
    }
    
    var canSave: Bool = false
    
    func moveDeskUp() {
        desk.moveUp()
        currentHeight = formatHeight()
    }
    
    func moveDeskDown() {
        desk.moveDown()
        currentHeight = formatHeight()
    }
    
    func initiateSave() {
        canSave = true
    }
    
    func save(position: Int) {
        guard canSave else { return }

        desk.savePosition(number: position)
        canSave = false
    }
    
    func applySavedPosition(_ position: Int) {
        desk.applySavedPosition(number: position)
        currentHeight = formatHeight()
    }
    
    private func formatHeight() -> String {
        String(format: "%.0f cm", desk.height)
    }
}
