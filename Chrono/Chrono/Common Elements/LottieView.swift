//
//  LottieView.swift
//  Chrono
//
//  Created by Sagar on 2021-06-22.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    var filename: String
  
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
    
        let animationView = AnimationView()
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
    
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    
        return view
    }
        
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}
