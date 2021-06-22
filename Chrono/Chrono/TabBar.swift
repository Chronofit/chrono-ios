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
                Label("Stopwatch", image: "timer_black")
            }

            NavigationView {
                Circuits()
            }
            .tabItem {
                Label("Circuits", image: "fitness_tab_black")
            }

            NavigationView {
                Settings()
            }
            .tabItem {
                Label("Settings", image: "settings_black")
            }
        }
        .accentColor(Color("ChronoAccentColor"))

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.light)
    }
}
