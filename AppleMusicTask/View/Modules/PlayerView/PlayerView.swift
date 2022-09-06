import SwiftUI

struct PlayerView: View {
    var body: some View {
        VStack {
            HStack {
                Image("MusicImage")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)

                Text("Miyagi & Andy Panda - Патрон")

                Button {

                } label: {
                    Image(systemName: "play.fill")
                }

                Button {

                } label: {
                    Image(systemName: "forward.fill")
                }
            }
            .foregroundColor(.black)

            Divider()
        }
        .padding(.top, 10)
        .foregroundColor(.secondary)
        .background(.ultraThickMaterial)

    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
