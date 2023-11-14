//
//  ForYouTabViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 14/11/23.
//

import Foundation

class ForYouTabViewModel : ObservableObject {
    @Published var searchText: String = ""
    @Published var showSearch: Bool = true
}
