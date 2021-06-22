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
                Image("timer_black")
            }

            NavigationView {
                Circuits()
            }
            .tabItem {
                Image("fitness_tab_black")
            }

            NavigationView {
                Settings()
            }
            .tabItem {
                Image("settings_black")
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
