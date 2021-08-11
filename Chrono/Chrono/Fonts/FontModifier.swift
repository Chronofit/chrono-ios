//
//  FontModifier.swift
//  Chrono
//
//  Created by Sagar on 2021-07-08.
//

import SwiftUI

enum CustomFontGroups {
    case nunito, opensans
}

enum CustomFontStyles {
    case bold, light, regular, semibold
}

private func resolveFontGroup (group: CustomFontGroups) -> String {
    switch group {
    case .nunito:
        return "Nunito"
    case .opensans:
        return "OpenSans"
    }
}

private func resolveFontStyle (style: CustomFontStyles) -> String {
    switch style {
    case .bold:
        return "Bold"
    case .light:
        return "Light"
    case .regular:
        return "Regular"
    case .semibold:
        return "SemiBold"
    }
}


struct CustomFont: ViewModifier {
    
    let fontGroup: CustomFontGroups
    let fontStyle: CustomFontStyles
    let size: CGFloat
            
    func body(content: Content) -> some View {
        
        let group = resolveFontGroup(group: fontGroup)
        let style = resolveFontStyle(style: fontStyle)
        let font = "\(group)-\(style)"
        
        content
            .font(.custom(font, size: size))
    }
}


extension View {
    func customFont(fontGroup: CustomFontGroups, fontStyle: CustomFontStyles, size: CGFloat) -> some View {
        self.modifier(CustomFont(fontGroup: fontGroup, fontStyle: fontStyle, size: size))
    }
}

