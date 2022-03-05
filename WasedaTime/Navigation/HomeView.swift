//
//  HomeView.swift
//  WasedaTime
//
//  Created by Takumi Otsuka on 5/3/22.
//

import SwiftUI

struct HomeView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(.main, .side)
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    ColorSchemeToggle(isOn: $isOn)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isOn: .constant(false))
    }
}
