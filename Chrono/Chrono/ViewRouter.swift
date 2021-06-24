//
//  ViewRouter.swift
//  Chrono
//
//  Created by Sagar on 2021-06-23.
//

import Foundation
import SwiftUI

enum ViewType {
    case main, onboarding
}

class ViewRouter: ObservableObject {

    init() {
        //Use this only to test!!
        //UserDefaults.standard.set(false, forKey: "didLaunchBefore")

        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            currentPage = .onboarding
        } else {
            currentPage = .main
        }
    }
    
    @Published var currentPage: ViewType
    
}

struct MotherView : View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            switch viewRouter.currentPage {
            case .onboarding:
                Onboarding()
            case .main:
                TabBar()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
