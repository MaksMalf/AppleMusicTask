import SwiftUI

struct MiniPlayerView: View {

    var animation: Namespace.ID
    var safeArea = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }?
        .safeAreaInsets
    @Binding var expand: Bool
    @State var volume: CGFloat = 0
    @State var offset: CGFloat = 0

    var body: some View {

        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                .opacity(expand ? 1 : 0)
                .padding(.top, expand ? safeArea?.top : 0)
                .padding(.vertical, expand ? 30 : 0)

            HStack(spacing: 15) {
                if expand {
                    Spacer(minLength: 0)
                }

                Image(Strings.musicImage)
                    .resizable()
                    .frame(width: expand ? UIScreen.screenHeight / 3 : 55, height: expand ? UIScreen.screenHeight / 3 : 55)
                    .cornerRadius(12)

                if !expand {
                    Text("\(Strings.nameArtists) - \(Strings.nameSong)")
                        .bold()
                        .font(.system(size: 16))
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "Lable", in: animation)
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

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        if expand {
                            Text(Strings.nameSong)
                                .font(.title3)
                                .fontWeight(.bold)

                            Text(Strings.nameArtists)
                                .font(.subheadline)
                        }
                    }
                    .matchedGeometryEffect(id: "Lable", in: animation)
                    .foregroundColor(.primary)

                    Spacer(minLength: 0)

                    Button {

                    } label: {
                        Image(systemName: Strings.ellipsButtonImage)
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding()
                .padding(.top, 20)

                ZStack(alignment: .leading) {
                    Capsule().fill(Color.black.opacity(0.08)).frame(height: 5)

                    Circle().frame(width: 8, height: 8)
                }
                .padding(.horizontal)

                HStack {
                    Text(Strings.startTimerText)
                        .font(.subheadline)

                    Spacer()

                    Text(Strings.finishTimerText)
                        .font(.subheadline)
                }
                .foregroundColor(.secondary)
                .padding(.horizontal)

                HStack(spacing: 85) {
                    Button {

                    } label: {
                        Image(systemName: Strings.backwardButtonImage)
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }

                    Button {

                    } label: {
                        Image(systemName: Strings.playButtonImage)
                            .font(.system(size: 45))
                            .foregroundColor(.primary)
                    }

                    Button {

                    } label: {
                        Image(systemName: Strings.forwardButtonImage)
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.top, 20)

                Spacer(minLength: 0)

                HStack(spacing: 15) {
                    Image(systemName: Strings.speakerButtonImage)

                    Slider(value: $volume)

                    Image(systemName: Strings.speakerWaveButtonImage)
                }
                .padding()

                HStack(spacing: 85) {
                    Button {

                    } label: {
                        Image(systemName: Strings.quoteButtonImage)
                    }

                    Button {

                    } label: {
                        Image(systemName: Strings.airplayaudioButtonImage)
                    }

                    Button {

                    } label: {
                        Image(systemName: Strings.listButtonImage)
                    }
                }
                .font(.title2)
                .foregroundColor(.primary)
                .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
            }
            .frame(width: expand ? nil : 0, height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        }
        .frame(maxHeight: expand ? .infinity : UIScreen.screenHeight * 0.1)
        .background(
            VStack(spacing: 0) {
                BlurView()

                Divider()
            }
        )
        .onTapGesture(count: 2) {
            withAnimation(.spring()) { expand.toggle() }
        }
        .cornerRadius(expand ? 20 : 0)
        .offset(y: expand ? 0 : -(UIScreen.screenWidth * 0.12))
        .ignoresSafeArea()
    }
}

extension MiniPlayerView {
    enum Strings {
        static let musicImage = "MusicImage"
        static let nameSong = "Патрон"
        static let nameArtists = "Miyagi & Andy Panda"
        static let startTimerText = "0:00"
        static let finishTimerText = "-4:12"

        static let playButtonImage = "play.fill"
        static let forwardButtonImage = "forward.fill"
        static let backwardButtonImage = "backward.fill"
        static let ellipsButtonImage = "ellipsis.circle"
        static let speakerButtonImage = "speaker.fill"
        static let speakerWaveButtonImage = "speaker.wave.2.fill"
        static let quoteButtonImage = "quote.bubble"
        static let airplayaudioButtonImage = "airplayaudio"
        static let listButtonImage = "list.bullet"
    }
}
