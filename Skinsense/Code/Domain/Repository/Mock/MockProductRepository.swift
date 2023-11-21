//
//  MockProductRepository.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

class MockProductRepository: IProductRepository {
    func fetchData(completion: @escaping ([Product]) -> Void) {
        let userData = User()
        userData.email = "email"
        userData.name = "Name"
        userData.photo = "photo"
        userData.skinConcerns = [SkinConcern(name: "Redness")]
        userData.skinTypes = [SkinType(name: "Dry")]
        userData.allergens = [Allergen(name: "Linalool")]
        
        let mockData : [Product] = [
            Product(
                id: UUID().uuidString,
                name: "Product 1",
                photo: "skincare_product1",
                categoryID: "Face Cleanser",
                goodForSkinType: ["Dry", "Oily"],
                badForSkinType: ["Sensitive"],
                goodFor: ["Acne"],
                badFor: ["Redness"],
                allergens: [],
                incompatibleIngredients: ["Vitamin A"],
                compatibleIngredients: ["Water", "Alcohol"],
                additionalInformations: "This is an additional information",
                reviews: [
                    Review(
                        id: UUID().uuidString,
                        rating: 3.2,
                        comment: "OK",
                        totalLikes: 10,
                        user: APIUser(id: UUID().uuidString)
                    )
                ]
            )
        ]
        
        completion(mockData)
    }
}
