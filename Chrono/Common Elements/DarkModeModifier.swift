//
//  DarkModeModifier.swift
//  Chrono
//
//  Created by Sagar R Patel on 2021-12-16.
//

import SwiftUI

public struct DarkModeModifier: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, .dark)
            .preferredColorScheme(.dark)
    }
}
