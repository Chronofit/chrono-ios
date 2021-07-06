//
//  TabBar.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView {
                Stopwatch()
            }
            .tabItem {
                Label(Constants.Strings.stopwatch, systemImage: "stopwatch")
            }
            NavigationView {
                Circuits()
            }
            .tabItem {
                Label(Constants.Strings.circuits, systemImage: "heart")
            }
            NavigationView {
                Settings()
            }
            .tabItem {
                Label(Constants.Strings.settings, systemImage: "gearshape.fill")
            }
        }
    }
}

struct TabBarPreviews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}
