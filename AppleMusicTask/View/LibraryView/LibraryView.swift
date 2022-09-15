import SwiftUI

struct LibraryView: View {

    @State private var isBool = true

    var body: some View {
        NavigationView {
            VStack {
                if isBool {
                    Spacer()

                    Text(Strings.mainText)
                        .font(.bold(.title2)())

                    Text(Strings.subMainText)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)

                    Spacer()

                } else {
                    ListMusicView()
                }
            }
            .navigationTitle(Strings.navTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isBool.toggle()
                    } label: {
                        Text(isBool ? Strings.navBarButtonTextTrue : Strings.navBarButtonTextFalse)
                            .foregroundColor(.red)
                    }
                }
            }
        }

    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

extension LibraryView {
    enum Strings {
        static let mainText = "Ищите свою музыку?"
        static let subMainText = "Здесь появиться купленная Вами в\niTunes Store музыка."
        static let navTitle = "Медиатека"
        static let navBarButtonTextTrue = "Править"
        static let navBarButtonTextFalse = "Готово"
    }
}
