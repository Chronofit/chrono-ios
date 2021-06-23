//
//  ChronoApp.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI
import Firebase

@main
struct ChronoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
    
}
