import SwiftUI

struct RadioView: View {

    let rows = [
        GridItem(.fixed(100))
    ]

    let columns = [
        GridItem(.flexible())
    ]

    let stations = StationModel().createModel()
    let radioList = RadioModel().createModel()

    var body: some View {
        NavigationView {
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
                        .padding([.leading, .bottom])
                    }

                    VStack(alignment: .leading) {
                        Divider()
                            .frame(width: 350)

                        Text("Станции")
                            .font(.title2)
                            .bold()
                    }

                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(stations) { station in
                            HStack {
                                Image(station.imageName)
                                    .resizable()
                                    .frame(width: 100, height: 100)


                                VStack(alignment: .leading) {
                                    Text(station.text)
                                    Text(station.subText)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .padding(.leading)
                    .navigationTitle("Радио")
                }
            }
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
