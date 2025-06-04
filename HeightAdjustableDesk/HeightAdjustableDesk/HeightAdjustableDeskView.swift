import SwiftUI

struct HeightAdjustableDeskView : View {
    let viewModel: HeightAdjustableDeskViewModel

    var body: some View {
        VStack {
            Text("Current Height: \(viewModel.currentHeight)")
            
            HStack {
                Button {
                    viewModel.moveDeskDown()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                }

                Button {
                    viewModel.moveDeskUp()
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HeightAdjustableDeskView(
        viewModel: .init(
            desk: .init(
                initialHeight: 100,
                minHeight: 50,
                maxHeight: 150
            )
        )
    )
}
