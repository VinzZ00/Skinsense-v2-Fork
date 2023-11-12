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
    
    var mockScanData: [ScanData] = [
        ScanData(content: "Salicylic Acid"),
        ScanData(content: "Melaleuca Alternifolia Leaf Oil"),
        ScanData(content: "Calophyllum Inophyllum Seed Oil"),
        ScanData(content: "Tocopherol")
    ]
    
    func handleUpdate(skinTypes: [SkinType], skinConcers: [SkinConcern], allergens: [Allergen]) {
        self.userData = User(id: UUID().uuidString, name: "Name", email: "Name", photo: "Photo", skinTypes: skinTypes, skinConcerns: skinConcers, allergens: allergens)
    }
    
    var body: some Scene {
        WindowGroup {
            ScanResultView(viewModel: ScanResultViewModel(scannedData: mockScanData))
//            if(userData != nil) {
//                MainView()
//            } else {
//                PersonalizationView(handleSelectPersonalization: handleUpdate)
//            }
        }
    }
}
