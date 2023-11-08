//
//  NavigationItem.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import Foundation

enum Page: String {
    case personalization
    case mainview
}

struct NavigationItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var page: Page
}
