//
//  NavigationBar.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI
import UIKit

struct NavBar: ViewModifier {
    @State var title: String

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.large)
            .navigationBarColor(backgroundColor: .systemBackground, tintColor: .label)
    }
}

struct InlineNavBar: ViewModifier {
    @State var title: String

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: .systemBackground, tintColor: .label)
    }
}

struct NavigationBarColor: ViewModifier {
    init(backgroundColor: UIColor, tintColor: UIColor) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = tintColor
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
        modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
    }
}
