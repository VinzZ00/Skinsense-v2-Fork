//
//  Product.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

struct Product : Codable {
    var id, name: String?
    var link: String?
    var brandName, categoryName, ingredients: String?
    var photo: String?
    var brandID, categoryID: String?
    
    var goodForSkinType: [String]?
    var badForSkinType: [String]?
    var goodFor: [String]?
    var badFor: [String]?
    var allergens: [Ingredient]?
    var incompatibleIngredients: [String]?
    var compatibleIngredients: [String]?
    var additionalInformations: String?
    var reviews: [Review]?

    enum CodingKeys: String, CodingKey {
        case id, name, link
        case brandName = "brand_name"
        case categoryName = "category_name"
        case ingredients, photo
        case brandID = "brand_id"
        case categoryID = "category_id"
    }
}
