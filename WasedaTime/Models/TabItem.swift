//
//  TabItem.swift
//  WasedaTime
//
//  Created by Takumi Otsuka on 5/3/22.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Home", icon: "house", tab: .home, color: .accent),
    TabItem(text: "Syllabus", icon: "book", tab: .book, color: .accent),
    TabItem(text: "Timetable", icon: "calendar", tab: .calendar, color: .accent),
    TabItem(text: "Campus", icon: "bus", tab: .bus, color: .accent),
]

enum Tab: String {
    case home
    case book
    case calendar
    case bus
}
