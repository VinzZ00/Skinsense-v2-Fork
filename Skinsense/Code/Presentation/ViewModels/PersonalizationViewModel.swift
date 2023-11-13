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
        SkinType(id: UUID(), name: "Combination"),
        SkinType(id: UUID(), name: "Dry"),
        SkinType(id: UUID(), name: "Normal"),
        SkinType(id: UUID(), name: "Sensitive")
    ]
    var skinConcerns : [SkinConcern] = [
        SkinConcern(id: UUID(), name: "Acne"),
        SkinConcern(id: UUID(), name: "Oiliness"),
        SkinConcern(id: UUID(), name: "Hormonal Acne"),
        SkinConcern(id: UUID(), name: "Texture"),
        SkinConcern(id: UUID(), name: "Dryness"),
        SkinConcern(id: UUID(), name: "Fungal Acne"),
        SkinConcern(id: UUID(), name: "Redness"),
        SkinConcern(id: UUID(), name: "Sensitivity"),
        SkinConcern(id: UUID(), name: "Fine Lines"),
        SkinConcern(id: UUID(), name: "Wrinkles"),
        SkinConcern(id: UUID(), name: "Dullness"),
        SkinConcern(id: UUID(), name: "Pores"),
        SkinConcern(id: UUID(), name: "Irritation"),
        SkinConcern(id: UUID(), name: "Rosacea"),
        SkinConcern(id: UUID(), name: "Eczema"),
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
