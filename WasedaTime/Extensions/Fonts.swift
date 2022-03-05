//
//  Fonts.swift
//  WasedaTime
//
//  Created by Takumi Otsuka on 5/3/22.
//

import SwiftUI

enum FontCase: String {
    case latoRegular = "Lato-Regular"
    case latoItalic = "Lato-Italic"
    case latoBold = "Lato-Bold"
    case latoThin = "Lato-Thin"
    case latoLight = "Lato-Light"
    case latoBlack = "Lato-Black"
    case arial = "Arial"
    case optima = "Optima"
}

struct Fonts: ViewModifier {
    var selection: FontCase
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(selection.rawValue, size: size))
    }
}

extension View {
    func font(selection: FontCase = .latoRegular, size: CGFloat) -> some View {
        modifier(Fonts(selection: selection, size: size))
    }
}
