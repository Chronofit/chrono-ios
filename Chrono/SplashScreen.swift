//
//  SplashView.swift
//  Chrono
//
//  Created by Sagar on 2021-06-21.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false

    var body: some View {
        VStack {
            if self.isActive {
                MotherView().environmentObject(ViewRouter())
            } else {
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

private struct SplashView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            if colorScheme == .dark {
                Color("SplashScreen_DarkBg")
                    .ignoresSafeArea()
            } else {
                LinearGradient(gradient: Gradient(colors: [Color("SplashScreen_LightGrad1"), Color("SplashScreen_LightGrad2")]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            }

            Image("SplashScreen_Logo")
                .padding()
                .offset(x: 0, y: -40.0)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
