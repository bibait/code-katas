import Foundation

@Observable
class HeightAdjustableDeskViewModel {
    private let desk: HeightAdjustableDesk
    
    init(desk: HeightAdjustableDesk) {
        self.desk = desk
    }
    
    private var canSave: Bool = false
    
    var currentHeight: Double {
        desk.height
    }
    
    func moveDeskUp() {
        desk.moveUp()
    }
    
    func moveDeskDown() {
        desk.moveDown()
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
    }
}
