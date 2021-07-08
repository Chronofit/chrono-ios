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
                Label(Strings.stopwatch, image: "timer_black")
            }
            NavigationView {
                Circuits()
            }
            .tabItem {
                Label(Strings.circuits, systemImage: "heart")
                Label(Strings.circuits, image: "fitness_tab_black")
            }
            NavigationView {
                Settings()
            }
            .tabItem {
                Label(Strings.settings, systemImage: "gearshape.fill")
                Label(Strings.settings, image: "settings_black")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.light)
    }
}
