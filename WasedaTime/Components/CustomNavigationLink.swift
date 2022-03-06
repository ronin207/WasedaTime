//
//  CustomNavigationLink.swift
//  WasedaTime
//
//  Created by Takumi Otsuka on 6/3/22.
//

import SwiftUI

struct CustomNavigationLink<Content: View>: View {
    let content: Content
    let image: String
    let title: String
    
    var body: some View {
        NavigationLink(destination: content) {
            HStack {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .padding(3)
                
                Text(title)
                    .font(selection: .latoRegular, size: 20)
            }
            .padding(10)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct CustomNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomNavigationLink(content: Text("Hello"), image: "work_outline", title: "Wave Hand")
                .navigationBarHidden(true)
        }
    }
}
