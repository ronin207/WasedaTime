//
//  ColorSchemeToggle.swift
//  WasedaTime
//
//  Created by Takumi Otsuka on 5/3/22.
//

import SwiftUI

struct ColorSchemeToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Image(systemName: isOn ? "moon.fill" : "sun.max.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .foregroundColor(.constellation)
        }
        .toggleStyle(ColorSchemeToggleStyle())
    }
}

struct ColorSchemeToggle_Previews: PreviewProvider {
    static var previews: some View {
        ColorSchemeToggle(isOn: .constant(false))
    }
}

struct ColorSchemeToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            configuration.label
                .padding(10)
                .contentShape(Circle())
        }
        .background(ColorSchemeBackgroundStyle(isHighlighted: configuration.isOn, shape: Circle()))
    }
}

struct ColorSchemeBackgroundStyle<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.side.opacity(0.1))
                    .overlay {
                        shape
                            .stroke(LinearGradient(.main.opacity(0.3), .side.opacity(0.3)), lineWidth: 3)
                    }
                    .shadow(color: .main.opacity(0.3), radius: 5, x: 0, y: 0)
                    .shadow(color: .side.opacity(0.3), radius: 5, x: 0, y: 0)
            } else {
                shape
                    .fill(LinearGradient(.main.opacity(0.1), .side.opacity(0.1)))
                    .shadow(color: .main.opacity(0.3), radius: 5, x: 0, y: 0)
                    .shadow(color: .side.opacity(0.3), radius: 5, x: 0, y: 0)
            }
        }
    }
}
