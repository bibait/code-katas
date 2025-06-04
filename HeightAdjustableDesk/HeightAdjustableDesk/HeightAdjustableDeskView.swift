import SwiftUI

struct HeightAdjustableDeskView : View {
    let viewModel: HeightAdjustableDeskViewModel

    var body: some View {
        VStack {
            HStack {
                Text("\(viewModel.currentHeight)")
                    .contentTransition(.numericText())

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
            
            HStack {
                Button {
                    viewModel.initiateSave()
                } label: {
                    Text("M")
                }
                
                ForEach(1..<5) { index in
                    Button {
                        if viewModel.canSave {
                            viewModel.save(position: index)
                        } else {
                            withAnimation {
                                viewModel.applySavedPosition(index)
                            }
                        }
                    } label: {
                        Text("\(index)")
                    }
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
