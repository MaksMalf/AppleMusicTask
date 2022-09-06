import SwiftUI

struct LibraryView: View {

    @State private var isBool = true

    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    if isBool {
                        Spacer()

                        Text("Ищите свою музыку?")
                            .font(.bold(.title2)())

                        Text("Здесь появиться купленная Вами в\niTunes Store музыка.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)

                        Spacer()

                    } else {
                        ListMusicView()
                    }

                    PlayerView()
                }
                .navigationTitle("Медиатека")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isBool.toggle()
                        } label: {
                            Text(isBool ? "Править" : "Готово")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .tabItem {
                Label("Медиатека", systemImage: "music.note.list");
            }

            RadioView()
                .tabItem {
                    Label("Радио", systemImage: "dot.radiowaves.left.and.right")
                }

            PlayerView()
                .tabItem {
                    Label("Поиск", systemImage: "magnifyingglass")
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
