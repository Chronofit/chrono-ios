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
        
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemID: "id-App Started)",
          AnalyticsParameterItemName: "App Started",
          AnalyticsParameterContentType: "cont",
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
    
}
