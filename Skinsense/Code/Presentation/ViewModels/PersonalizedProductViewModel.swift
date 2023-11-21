//
//  PersonalizedProductViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 21/11/23.
//

import Foundation

class PersonalizedProductViewModel: ObservableObject {
    var productRepository : ProductRepository = ProductRepository()
    
    @Published var products: [Product]?
    
    func fetchProducts(category: String) {
        let userData = CoreDataManager.shared.fetchUserData().first
        
        if let userData = userData {
            let skinTypes : [PersonalizationData] = userData.skinTypes?.allObjects as [PersonalizationData]
            let concerns : [PersonalizationData] = userData.skinConcerns?.allObjects as [PersonalizationData]
            
            let skinTypesArr = skinTypes.map({$0.name ?? ""})
            let concernsArr = concerns.map({$0.name ?? ""})
            
            productRepository.getRecommended(category: category, skinTypes: skinTypesArr, concerns: concernsArr) { result in
                switch result {
                case .success(let success):
                    self.products = success
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
}
