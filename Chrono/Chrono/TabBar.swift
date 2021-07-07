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
                Label(Strings.stopwatch, systemImage: "stopwatch")
            }
            NavigationView {
                Circuits()
            }
            .tabItem {
                Label(Strings.circuits, systemImage: "heart")
            }
            NavigationView {
                Settings()
            }
            .tabItem {
                Label(Strings.settings, systemImage: "gearshape.fill")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}
