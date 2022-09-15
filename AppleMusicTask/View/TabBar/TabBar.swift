//
//  TabBar.swift
//  AppleMusicTask
//
//  Created by Maksim Malofeev on 11/09/2022.
//

import SwiftUI

struct TabBar: View {

    @State var expand = false

    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView {
                LibraryView()
                    .tabItem {
                        Label(Strings.firstTabBarText, systemImage: Strings.firstTabBarImage);
                    }

                RadioView()
                    .tabItem {
                        Label(Strings.secondTabBarText, systemImage: Strings.secondTabBarImage)
                    }

                SearchView()
                    .tabItem {
                        Label(Strings.thirdTabBarText, systemImage: Strings.thirdTabBarImage)
                    }
            }
            .accentColor(.red)
            
            MiniPlayerView(animation: animation, expand: $expand)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

extension TabBar {
    enum Strings {
        static let firstTabBarText = "Медиатека"
        static let firstTabBarImage = "music.note.list"

        static let secondTabBarText = "Радио"
        static let secondTabBarImage = "dot.radiowaves.left.and.right"

        static let thirdTabBarText = "Поиск"
        static let thirdTabBarImage = "magnifyingglass"
    }
}
