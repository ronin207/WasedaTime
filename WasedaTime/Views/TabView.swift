//
//  TabView.swift
//  WasedaTime
//
//  Created by Takumi Otsuka on 5/3/22.
//

import SwiftUI

struct TabView: View {
    // MARK: Tab
    @State var selectedTab: Tab = .home
    @State var color: Color = .accent
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: Switch - Case (Tab)
            Group {
                switch selectedTab {
                case .home:
                    Text("Home")
                case .book:
                    Text("Syllabus")
                case .calendar:
                    Text("Timetable")
                case .bus:
                    Text("Campus")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            tab
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}

extension TabView {
    // MARK: Tab Bar
    private var tab: some View {
        HStack {
            ForEach(tabItems) { item in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = item.tab
                        color = item.color
                    }
                } label: {
                    // MARK: Tab Item Label
                    VStack(spacing: 5) {
                        Image(item.icon)
                            .resizable()
                            .font(.body.bold())
                            .frame(width: 30, height: 30)
                        Text(item.text)
                            .font(.caption2)
                            .lineLimit(1)
                    }
                    .frame(maxWidth: .infinity)
                }
                .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
                .blendMode(selectedTab == item.tab ? .overlay : .normal)
            }
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .background {
            // MARK: Circular Background Highlight
            HStack {
                if selectedTab == .bus { Spacer() }
                if selectedTab == .book { Spacer() }
                if selectedTab == .calendar {
                    Spacer()
                    Spacer()
                }
                Circle()
                    .fill(color)
                    .frame(width: 88)
                if selectedTab == .home { Spacer() }
                if selectedTab == .book {
                    Spacer()
                    Spacer()
                }
                if selectedTab == .calendar { Spacer() }
            }
            .padding(.horizontal, 8)
        }
        .overlay {
            // MARK: Rectangular Label Highlight
            HStack {
                if selectedTab == .bus { Spacer() }
                if selectedTab == .book { Spacer() }
                if selectedTab == .calendar {
                    Spacer()
                    Spacer()
                }
                Rectangle()
                    .fill(color)
                    .frame(width: 28, height: 5)
                    .cornerRadius(3)
                    .frame(width: 88)
                    .frame(maxHeight: .infinity, alignment: .top)
                if selectedTab == .home { Spacer() }
                if selectedTab == .book {
                    Spacer()
                    Spacer()
                }
                if selectedTab == .calendar { Spacer() }
            }
            .padding(.horizontal, 8)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}
