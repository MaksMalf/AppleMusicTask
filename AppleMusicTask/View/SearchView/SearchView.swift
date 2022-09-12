import SwiftUI

struct SearchView: View {

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let albums = StationModel().createModel()
    var filtredAlbums: [StationModel] {
        if searchText.isEmpty {
            return albums
        } else {
            return albums.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
        }
    }
    @State private var searchText = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {

                    Text("Поиск по категориям")
                        .font(.title2)
                        .bold()
                        .padding(.leading)


                    LazyVGrid(columns: columns, alignment: .leading, spacing: 5) {
                        ForEach(filtredAlbums) { album in
                            NavigationLink {
                                AlbumView()
                            } label: {
                                ZStack(alignment: .bottomLeading) {
                                    Image(album.imageName)
                                        .resizable()
                                        .frame(width: (UIScreen.screenWidth - 50) / 2, height: UIScreen.screenHeight / 5.5)
                                        .cornerRadius(12)
                                        .padding(.top, 8)

                                    Text(album.text)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                    }
                    .padding([.trailing, .leading])
                }
                .padding(.bottom, 80)
            }
            .searchable(text: $searchText, prompt: "Ваша медиатека")
            .navigationTitle("Поиск")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
