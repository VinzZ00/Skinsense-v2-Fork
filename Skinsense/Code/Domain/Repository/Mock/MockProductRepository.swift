//
//  MockProductRepository.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

class MockProductRepository: IProductRepository {
    func fetchData(completion: @escaping ([Product]) -> Void) {
        let mockData : [Product] = [
            Product(
                id: UUID().uuidString,
                name: "Product 1",
                photo: "skincare_product1",
                category: "Face Cleanser",
                goodForSkinType: ["Dry", "Oily"],
                badForSkinType: ["Sensitive"],
                goodFor: ["Acne"],
                badFor: ["Redness"],
                allergens: [],
                incompatibleIngredients: ["Vitamin A"],
                compatibleIngredients: ["Water", "Alcohol"],
                additionalInformations: "This is an additional information"
            )
        ]
        
        completion(mockData)
    }
}
