//
//  SkinsenseApp.swift
//  Skinsense
//
//  Created by Rainer Regan on 02/11/23.
//

import SwiftUI

@main
struct SkinsenseApp: App {
    @State var userData: User?
    
    func handleUpdate(skinTypes: [SkinType], skinConcers: [SkinConcern], allergens: [Allergen]) {
        self.userData = User(id: UUID().uuidString, name: "Name", email: "Name", photo: "Photo", skinTypes: skinTypes, skinConcerns: skinConcers, allergens: allergens)
    }
    
    var body: some Scene {
        WindowGroup {
            if(userData != nil) {
                MainView()
            } else {
                PersonalizationView(handleSelectPersonalization: handleUpdate)
            }
        }
    }
}
