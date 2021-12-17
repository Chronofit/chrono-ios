//
//  Onboarding.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI

struct OnboardingModel: Identifiable {
    let id = UUID()
    let title: String
    let detail: String
    let asset: String
    var isAnimation: Bool = false
}

private let data: [OnboardingModel] = [
    OnboardingModel(
        title: "Welcome",
        detail: "Thank you for choosing Chrono! Let’s \nwalk you through how our app \nworks.",
        asset: "onboard_welcome",
        isAnimation: true
    ),
    OnboardingModel(
        title: "Save custom circuits",
        detail: "Customize your circuit with your\n desired times, title, and icon. Click on\n your saved circuit to run it.",
        asset: "onboard_circuits"
    ),
    OnboardingModel(
        title: "Use the stopwatch",
        detail: "With integrated lap functionality, our\n stopwatch will help you time\n basically anything.",
        asset: "onboard_stopwatch"
    ),
    OnboardingModel(
        title: "Dark mode",
        detail: "Use the settings page to personalize your Chrono experience. Also there’s dark mode. 🖐 🎤 ⬇",
        asset: "onboard_dark"
    ),
    OnboardingModel(
        title: "You’re all set",
        detail: "Feel free to leave us feedback and\nconsider joining our Discord server. We\n hope you enjoy using Chrono!",
        asset: "onboard_final",
        isAnimation: true
    ),
]

struct Onboarding: View {
    @State private var selectedPage = 0

    var body: some View {
        VStack {
            
            TabView(selection: $selectedPage.animation()) {
                ForEach(data.indices) { index in
                    Onboarding_Subview(data: data[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            PageControl(currentPage: $selectedPage, numberOfPages: data.count)
                .padding(.bottom)
            Onboarding_BottomButtons(selectedPage: $selectedPage)
                .edgesIgnoringSafeArea(.bottom)
                .frame(height: 60, alignment: .center)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .background(Color.init("Velvet").ignoresSafeArea())
    }
}

struct Onboarding_Subview: View {
    let data: OnboardingModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Spacer()
                    if data.isAnimation {
                        LottieView(filename: data.asset)
                            .frame(height: geometry.size.height * 0.6, alignment: .center)
                    } else {
                        Image(data.asset)
                            .resizable()
                            .scaledToFit()
                            .frame(height: geometry.size.height * 0.6, alignment: .center)
                    }
                    Spacer()
                }

                Text(data.title)
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding()

                Text(data.detail)
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .lineSpacing(5)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

struct Onboarding_BottomButtons: View {
    @Binding var selectedPage: Int
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.openURL) var openURL

    var body: some View {
        HStack {
            if selectedPage != (data.count - 1) {
                Button(action: {
                    UserDefaults.standard.set(true, forKey: "didLaunchBefore")
                    withAnimation {
                        viewRouter.currentPage = .main
                    }
                }, label: {
                    Text("Skip")
                        .foregroundColor(Color("Onboard-SkipButton"))
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .padding(.leading)
                })
                Spacer()
                Button(action: {
                    withAnimation { selectedPage += 1 }
                }, label: {
                    Text("Next")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .padding(.trailing)
                })
            } else {
                CapsuleButton(color: Color("Discord-Color")) {
                    Button(action: {
                        openURL(URL(string: "https://discord.com/invite/UbWrRxwkgR")!)
                    }, label: {
                        HStack {
                            Image("Discord-Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 23, alignment: .center)

                            Text("Discord")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    })
                }
                Spacer()
                CapsuleButton(color: .accentColor) {
                    Button(action: {
                        UserDefaults.standard.set(true, forKey: "didLaunchBefore")
                        withAnimation {
                            viewRouter.currentPage = .main
                        }
                    }, label: {
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    })
                }
            }
        }
    }
}

public struct CapsuleButton<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme

    let content: () -> Content
    let color: Color

    public init(color: Color, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.color = color
    }

    public var body: some View {
        self.content()
            .padding(.horizontal, 30)
            .background(
                Capsule()
                    .foregroundColor(color)
                    .frame(height: 50, alignment: .center)
                    .shadow(color: colorScheme == .light ? Color(hex: "DFE0DF") : .clear, radius: 2, x: 0.0, y: 2.0)
            )
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
            .preferredColorScheme(.dark)
    }
}
