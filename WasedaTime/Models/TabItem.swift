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
    TabItem(text: "Home", icon: "library_books", tab: .home, color: .accent),
    TabItem(text: "Syllabus", icon: "class", tab: .book, color: .accent),
    TabItem(text: "Timetable", icon: "date_range", tab: .calendar, color: .accent),
    TabItem(text: "Campus", icon: "location_on", tab: .bus, color: .accent),
]

enum Tab: String {
    case home
    case book
    case calendar
    case bus
}
