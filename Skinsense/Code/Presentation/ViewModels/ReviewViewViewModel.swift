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
    var userRepository: UserRepository = UserRepository()
    
    @Published var reviews: [Review] = []
    @Published var product: Product?
    @Published var showAddReviewSheet: Bool = false
    @Published var userData: APIUser?
    
    init(productId: String) {
        self.productId = productId
        
        let coreUserData = CoreDataManager.shared.fetchUserData().first
        
        if let coreUserData = coreUserData, let userId = coreUserData.appleUserId {
            fetchUser(userId: userId)
        }
        
        fetchReviews()
        fetchProduct()
    }
    
    func fetchUser(userId: String) {
        userRepository.getById(userId: userId) { result in
            switch result {
            case .success(let user):
                self.userData = user
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchProduct() {
        repository.getById(productId: self.productId) { result in
            switch result {
            case .success(let success):
                self.product = success
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
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
