import SwiftUI

struct SearchView: View {

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @ObservedObject var albums = StationModel()

    var filtredAlbums: [Station] {
        if searchText.isEmpty {
            return albums.stationModel
        } else {
            return albums.stationModel.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
        }
    }

    @State var expand = false
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {

                VStack(alignment: .leading) {

                    Text(Strings.subTitle)
                        .font(.title2)
                        .bold()
                        .padding(.leading)

                    LazyVGrid(columns: columns, alignment: .leading, spacing: 5) {
                        ForEach(filtredAlbums) { album in
                            NavigationLink {
                                AlbumView()
                                    .navigationTitle(album.text)
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
                                .navigationTitle(Strings.navigationTitle)
                            }
                        }
                    }
                    .padding([.trailing, .leading])
                }
                .padding(.bottom, 80)
            }
            .searchable(text: $searchText, prompt: Strings.searchBarText)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension SearchView {
    enum Strings {
        static let subTitle = "Поиск по категориям"
        static let navigationTitle = "Поиск"
        static let searchBarText = "Ваша медиатека"
    }
}
