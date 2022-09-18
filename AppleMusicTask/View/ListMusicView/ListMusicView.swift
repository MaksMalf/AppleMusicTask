import SwiftUI

struct ListMusicView: View {
    @State var cells = ModelCell().createModel()
    @State private var selectedCells: Set<ModelCell>?
    @Environment(\.editMode) private var editMode

    var body: some View {
        List(selection: $selectedCells) {
            ForEach(cells) { cell in
                HStack {
                    Image(systemName: cell.imageName)
                        .foregroundColor(.red)
                    Text(cell.text)
                }
                .font(.system(size: 20))
            }
            .onMove { indexSet, index in
                cells.move(fromOffsets: indexSet, toOffset: index)
            }
        }
        .environment(\.editMode, Binding.constant(EditMode.active))
        .listStyle(.inset)
    }
}

struct ListMusicView_Previews: PreviewProvider {
    static var previews: some View {
        ListMusicView()
    }
}
