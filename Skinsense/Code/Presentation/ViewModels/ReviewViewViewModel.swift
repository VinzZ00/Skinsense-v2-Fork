//
//  ReviewViewViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 20/11/23.
//

import Foundation

class ReviewViewViewModel : ObservableObject {
    var productId : String
    var repository: ProductRepository = ProductRepository()
    
    @Published var reviews: [Review] = []
    
    init(productId: String) {
        self.productId = productId
        fetchReviews()
    }
    
    func fetchReviews() {
        repository.getReviews(productId: self.productId) { result in
            switch result {
            case .success(let success):
                self.reviews = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
