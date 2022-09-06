import SwiftUI

struct LibraryView: View {

    @State private var isBool = true

    var body: some View {
        TabView {
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

                    PlayerView()
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
            .tabItem {
                Label(Strings.firstTabBarText, systemImage: Strings.firstTabBarImage);
            }

            RadioView()
                .tabItem {
                    Label(Strings.secondTabBarText, systemImage: Strings.secondTabBarImage)
                }

            PlayerView()
                .tabItem {
                    Label(Strings.thirdTabBarText, systemImage: Strings.thirdTabBarImage)
                }
        }
        .accentColor(.red)
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

        static let firstTabBarText = "Медиатека"
        static let firstTabBarImage = "music.note.list"

        static let secondTabBarText = "Радио"
        static let secondTabBarImage = "dot.radiowaves.left.and.right"

        static let thirdTabBarText = "Поиск"
        static let thirdTabBarImage = "magnifyingglass"
    }
}
