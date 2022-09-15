import SwiftUI

struct MiniPlayerView: View {

    var animation: Namespace.ID
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
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
                    Text(Strings.songTitle)
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
                            Text(Strings.songTitle)
                                .font(.title3)
                                .fontWeight(.bold)

                            Text("Miyagi and Endshpil")
                                .font(.subheadline)
                        }
                    }
                    .matchedGeometryEffect(id: "Lable", in: animation)
                    .foregroundColor(.primary)


                    Spacer(minLength: 0)

                    Button {

                    } label: {
                        Image(systemName: "ellipsis.circle")
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
                    Text("0:00")
                        .font(.subheadline)

                    Spacer()

                    Text("-4:12")
                        .font(.subheadline)
                }
                .foregroundColor(.secondary)
                .padding(.horizontal)

                HStack(spacing: 85) {

                    Button {

                    } label: {
                        Image(systemName: "backward.fill")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }

                    Button {

                    } label: {
                        Image(systemName: "play.fill")
                            .font(.system(size: 45))
                            .foregroundColor(.primary)
                    }

                    Button {

                    } label: {
                        Image(systemName: "forward.fill")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }

                }
                .padding(.top, 20)


                Spacer(minLength: 0)

                HStack(spacing: 15) {

                    Image(systemName: "speaker.fill")

                    Slider(value: $volume)

                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()

                HStack(spacing: 85) {

                    Button {

                    } label: {
                        Image(systemName: "quote.bubble")
                            .font(.title2)
                    }

                    Button {

                    } label: {
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                    }

                    Button {

                    } label: {
                        Image(systemName: "list.bullet")
                            .font(.title2)
                    }
                }
                .foregroundColor(.primary)
                .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
            }
            .frame(height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        }
        .frame(maxHeight: expand ? .infinity : 80)
        .background(
            VStack(spacing: 0) {

                BlurView()

                Divider()
            }
        )
        .onTapGesture(count: 2) {
            withAnimation(.spring()) { expand = true }
        }
        .cornerRadius(expand ? 20 : 0)
        .offset(y: expand ? 0 : -46)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
        .ignoresSafeArea()
    }

    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 && expand {
            offset = value.translation.height
        }
    }

    func onEnded(value: DragGesture.Value) {
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            if value.translation.height > UIScreen.screenHeight / 3 {
                expand = false
            }

            offset = 0
        }
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
