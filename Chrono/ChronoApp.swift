//
//  ChronoApp.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth

import SwiftUI

@main
struct ChronoApp: App {
    init() {
        FirebaseApp.configure()

        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "id-App Started)",
            AnalyticsParameterItemName: "App Started",
            AnalyticsParameterContentType: "cont",
        ])
        
        Auth.auth().signInAnonymously { authResult, error in
          // ...
            guard let user = authResult?.user else{ return}
            print("user Id " + user.uid)
        }
        

        let db = Firestore.firestore()

        var ref:DocumentReference? = nil

        db.collection("Circuits").document("trial").setData([
            "image": "Swift is broken",
            "name": "push"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }


        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modifier(DarkModeModifier())
        }
    }
}
