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
                GeometryReader { proxy in
                    Image(isOn ? "waseda_dark" : "waseda_light")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width)
                        .ignoresSafeArea()
                        .blur(radius: 3)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        
                        VStack(spacing: 10) {
                            Text("WasedaTime")
                                .font(selection: .optima, size: 40)
                            
                            Text("An unofficial app for syllabus searching, classroom finding, and bus schedule checking at Waseda University")
                                .font(selection: .arial, size: 20)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                    }
                    .foregroundColor(.text1)
                }
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
