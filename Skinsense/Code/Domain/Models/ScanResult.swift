//
//  ScanResult.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

struct ScanResult {
    var id = UUID()
    var goodForSkinType: [String]
    var badForSkinType: [String]
    var goodFor: [String]
    var badFor: [String]
    var allergens: [Ingredient]?
    var incompatibleIngredients: [String]?
    var compatibleIngredients: [String]?
    var additionalInformations: String?
    var similarProduct: Product?
}
