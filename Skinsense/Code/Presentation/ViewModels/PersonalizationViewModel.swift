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
    
    init() {
        self.fetchUserData()
    }
    
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
    
    func fetchUserData() {
        if let userData = CoreDataManager.shared.fetchUserData().first {
            let skinConcerns : [PersonalizationData] = userData.skinConcerns?.allObjects as? [PersonalizationData] ?? []
            let skinTypes : [PersonalizationData] = userData.skinTypes?.allObjects as? [PersonalizationData] ?? []
            let allergens : [PersonalizationData] = userData.allergens?.allObjects as? [PersonalizationData] ?? []
            
            let skinConcernsArr = skinConcerns.map({$0.name})
            let skinTypesArr = skinTypes.map({$0.name})
            let allergensArr = allergens.map({$0.name})
            
            let selectedConcerns = self.skinConcerns.filter { test in
                skinConcernsArr.contains(test.name)
            }
            let selectedTypes = self.skinTypes.filter { test in
                skinTypesArr.contains(test.name)
            }
            let selectedAllergens = self.allergens.filter { test in
                allergensArr.contains(test.name)
            }
            
            self.selectedAllergens = selectedAllergens
            self.selectedSkinTypes = selectedTypes
            self.selectedSkinConcerns = selectedConcerns
        }
    }
    
    func addSkinType(skinType: SkinType) {
        if self.selectedSkinTypes.contains(where: { test in
            test.id == skinType.id
        }) {
            self.selectedSkinTypes.removeAll { test in
                test.id == skinType.id
            }
            return
        }
        
        if self.selectedSkinTypes.count == 2 {
            print("Max skin types selected.")
        } else {
            print("Adding skin type: \(skinType.name)")
            self.selectedSkinTypes.append(skinType)
        }
    }
    
    func addSkinConcern(skinConcern: SkinConcern) {
        if self.selectedSkinConcerns.contains(where: { test in
            test.id == skinConcern.id
        }) {
            self.selectedSkinConcerns.removeAll { test in
                test.id == skinConcern.id
            }
        } else {
            print("Adding skin concern")
            self.selectedSkinConcerns.append(skinConcern)
        }
    }
    
    func addAllergen(allergen: Allergen) {
        if self.selectedAllergens.contains(where: { test in
            allergen.id == test.id
        }) {
            self.selectedAllergens.removeAll { test in
                test.id == allergen.id
            }
        } else {
            print("Adding skin type")
            self.selectedAllergens.append(allergen)
        }
    }
    
    func handleUpdate(callback: (User?) -> Void) {
        // First, check if user data already exists
        let savedUserData = CoreDataManager.shared.fetchUserData().first
        
        if let userData = savedUserData {
            let user = CoreDataManager.shared.updateUserData(
                userData: userData,
                skinConcerns: self.selectedSkinConcerns,
                skinTypes: self.selectedSkinTypes,
                allergens: self.selectedAllergens
            )
            
            callback(user)
        } else {
            let user = CoreDataManager.shared.saveUserData(email: "Email", name: "Name", photo: "Photo", skinConcerns: self.selectedSkinConcerns, skinTypes: self.selectedSkinTypes, allergens: self.selectedAllergens)
            callback(user)
        }
    }
}
