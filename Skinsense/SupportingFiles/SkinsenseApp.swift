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
    
    func handleUpdate(skinTypes: [String], skinConcers: [String]) {
        self.userData = User(id: UUID().uuidString, name: "Name", email: "Name", photo: "Photo", skinTypes: skinTypes, skinConcerns: skinConcers)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
