//
//  Ingredient.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

//struct Ingredient {
//    var id: String
//    var name: String
//    var description: String
//    var goodForSkinType: [String]
//    var badForSkinType: [String]
//    var goodFor: [String]
//    var badFor: [String]
//}

// MARK: - Ingredient
struct Ingredient: Codable {
    var id: Int?
    var categories, benefits, concerns, description: String?
    var purposes, goodFor, badFor, goodForSkinType: String?
    var badForSkinType, incompatibleIngredients, enhancer: String?
    var isActiveIngredients: Int?
    var references: String?
    var cosingID: Int?
    var additionalDescription, name: String?

    enum CodingKeys: String, CodingKey {
        case id, categories, benefits, concerns, description, purposes
        case goodFor = "good_for"
        case badFor = "bad_for"
        case goodForSkinType = "good_for_skin_type"
        case badForSkinType = "bad_for_skin_type"
        case incompatibleIngredients = "incompatible_ingredients"
        case enhancer
        case isActiveIngredients = "is_active_ingredients"
        case references
        case cosingID = "cosing_id"
        case additionalDescription = "additional_description"
        case name
    }
    
    func getIngredientGoodFor() -> [String] {
        guard let goodFor = self.goodFor else {
            return []
        }
        
        let splitted = goodFor.components(separatedBy: ",").map { test in
            test.trimmingCharacters(in: .whitespaces)
        }
        
        return splitted
    }
}
