//
//  PersonalizationViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 07/11/23.
//

import Foundation

class PersonalizationViewModel: ObservableObject {
    @Published var isSheetOpened = true
    @Published var selectedSkinTypes: [SkinType] = []
    @Published var selectedSkinConcerns: [SkinConcern] = []
    @Published var selectedAllergens: [Allergen] = []
    
    var skinTypes : [SkinType] = [
        SkinType(id: UUID(), name: "Combination Skin"),
        SkinType(id: UUID(), name: "Dry Skin"),
        SkinType(id: UUID(), name: "Normal Skin"),
        SkinType(id: UUID(), name: "Sensitive Skin")
    ]
    var skinConcerns : [SkinConcern] = [
        SkinConcern(id: UUID(), name: "Acne"),
        SkinConcern(id: UUID(), name: "Anti-Aging"),
        SkinConcern(id: UUID(), name: "Eczema"),
        SkinConcern(id: UUID(), name: "Dark Sports"),
        SkinConcern(id: UUID(), name: "Fungal Acne"),
        SkinConcern(id: UUID(), name: "Reduces Irritations"),
        SkinConcern(id: UUID(), name: "Rocasea"),
        SkinConcern(id: UUID(), name: "Scar Healing"),
        SkinConcern(id: UUID(), name: "Texture"),
        SkinConcern(id: UUID(), name: "Large Pores"),
    ]
    var allergens : [Allergen] = [
        Allergen(id: UUID(), name: "None"),
        Allergen(id: UUID(), name: "Fragrance"),
        Allergen(id: UUID(), name: "Alcohol"),
        Allergen(id: UUID(), name: "Smooth"),
        Allergen(id: UUID(), name: "Latex"),
        Allergen(id: UUID(), name: "Preservatives"),
    ]
}
