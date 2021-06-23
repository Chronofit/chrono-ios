//
//  Leading.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI

public struct Leading<Content: View>: View {
    let content: () -> Content
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    public var body: some View {
        HStack {
            self.content()
            Spacer()
        }
    }
}
