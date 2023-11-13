//
//  MainAppViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 13/11/23.
//

import Foundation

class MainAppViewModel: ObservableObject {
    @Published var userData : User? = nil
    @Published var isLoading : Bool = true
    
    func fetchUserData() {
        self.isLoading = true
        let userData = CoreDataManager.shared.fetchUserData()
        if !userData.isEmpty {
            self.userData = userData.first
        }
        self.isLoading = false
    }
}
