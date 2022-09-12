import SwiftUI

struct MiniPlayerView: View {

    var animation: Namespace.ID
    @Binding var expand: Bool

    var body: some View {
        VStack {
            HStack(spacing: 15) {

                if expand {
                    Spacer(minLength: 0)
                }

                Image(Strings.musicImage)
                    .resizable()
                    .frame(width: expand ? UIScreen.screenHeight / 3 : 55, height: expand ? UIScreen.screenHeight / 3 : 55)
                    .cornerRadius(12)

                if !expand {
                    Text(Strings.songTitle)
                        .bold()
                        .font(.system(size: 16))
                        .lineLimit(1)
                }

                Spacer(minLength: 0)

                if !expand {
                    Button {

                    } label: {
                        Image(systemName: Strings.playButtonImage)
                    }

                    Button {

                    } label: {
                        Image(systemName: Strings.forwardButtonImage)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .foregroundColor(.primary)
        }
        .frame(maxHeight: expand ? .infinity : 80)
        .background(
            VStack(spacing: 0) {

                BlurView()

                Divider()
            }
        )
        .onTapGesture(count: 2) {
            withAnimation(.spring()) { expand.toggle() }
        }
        .ignoresSafeArea()
        .offset(y: expand ? 0 : -46)
    }
}

extension MiniPlayerView {
    enum Strings {
        static let musicImage = "MusicImage"
        static let songTitle = "Miyagi & Andy Panda - Патрон"

        static let playButtonImage = "play.fill"
        static let forwardButtonImage = "forward.fill"
    }
}
