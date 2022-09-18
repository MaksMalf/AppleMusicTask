//
//  BlurView.swift
//  AppleMusicTask
//
//  Created by Maksim Malofeev on 11/09/2022.
//

import SwiftUI

struct BlurView: UIViewRepresentable {

    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
    }
}
