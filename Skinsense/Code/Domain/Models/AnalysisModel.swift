//
//  AnalysisModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 12/11/23.
//

import Foundation

// MARK: - AnalysisModel
struct AnalysisModel: Decodable {
    var id: String?
    var score, denominator: Double?
    var percentage: Double?
    var negEffects, posEffects: [Effect]?
    var ingredients: [Ingredient]?
    var product: Product?
    var similarProducts: [Product]?
    var goodForSkinType: [String]
    var badForSkinType: [String]
    var goodFor: [String]
    var badFor: [String]
    var allergens: [Ingredient]?
    var incompatibleIngredients: [String]?
    var compatibleIngredients: [String]?
    var additionalDescriptions: [String]?
}

// MARK: - Effect
struct Effect: Codable {
    var name: String?
    var occurrence: Int?
}
