//
//  Product.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

struct Product {
    var id : String
    var name : String
    var photo: String
    var category: String
    var goodForSkinType: [String]
    var badForSkinType: [String]
    var goodFor: [String]
    var badFor: [String]
    var allergens: [Ingredient]?
    var incompatibleIngredients: [String]?
    var compatibleIngredients: [String]?
    var additionalInformations: String?
    var reviews: [Review]?
}
