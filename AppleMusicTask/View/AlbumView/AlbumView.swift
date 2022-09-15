import SwiftUI

struct AlbumView: View {
    let rows = [
        GridItem(.flexible())
    ]

    let stations = StationModel().createModel()
    let radioList = RadioModel().createModel()

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows) {
                        ForEach(radioList) { radio in
                            VStack(alignment: .leading) {
                                Divider()
                                Text(radio.topText)
                                    .foregroundColor(.secondary)
                                    .font(.subheadline)
                                Text(radio.middleText)
                                    .font(.title3)
                                Text(radio.bottomText)
                                    .foregroundColor(.secondary)
                                    .font(.subheadline)
                                Image(radio.imageName)
                                    .resizable()
                                    .frame(width: UIScreen.screenWidth / 1.2, height: UIScreen.screenHeight / 3.3)
                            }
                        }
                    }
                }

                VStack(alignment: .center) {
                    
                    Divider()

                    HStack {
                        Text("Станции")
                            .font(.title2)
                            .bold()

                        Spacer()

                        Button {

                        } label: {
                            Text("См. все")
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.trailing)
                }


                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows) {
                        ForEach(stations) { station in
                            Image(station.imageName)
                                .resizable()
                                .frame(width: UIScreen.screenWidth / 2.2, height: UIScreen.screenWidth / 2.2)
                        }
                    }
                }
            }
            .padding(.leading)
        }
        .navigationBarTitle("Радио")
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
