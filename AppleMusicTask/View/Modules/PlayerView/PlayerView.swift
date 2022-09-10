import SwiftUI

struct PlayerView: View {
    var body: some View {
        VStack {
            HStack {
                Image(Strings.musicImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)

                Text(Strings.songTitle)

                Button {

                } label: {
                    Image(systemName: Strings.playButtonImage)
                }

                Button {

                } label: {
                    Image(systemName: Strings.forwardButtonImage)
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

extension PlayerView {
    enum Strings {
        static let musicImage = "MusicImage"
        static let songTitle = "Miyagi & Andy Panda - Патрон"

        static let playButtonImage = "play.fill"
        static let forwardButtonImage = "forward.fill"
    }
}
