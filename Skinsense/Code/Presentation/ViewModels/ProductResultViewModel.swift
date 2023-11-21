//
//  ProductResultViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

class ProductResultViewModel: ObservableObject {
    private var productRepository: ProductRepository = ProductRepository()
    private var analyzerRepository: AnalyzerRepository = AnalyzerRepository()
    private var reviewRepository: ReviewRepository = ReviewRepository()
    
    @Published var scanRequest: AnalysisRequest?
    @Published var scanResult: AnalysisModel?
    @Published var skinConcerns: [PersonalizationData]?
    @Published var skinTypes: [PersonalizationData]?
    
    @Published var productData: Product?
    @Published var isLoading: Bool = true
    
    @Published var reviews: [Review]?
    
    func getAnalysis() {
        guard let scanRequest = self.scanRequest else { return }
        analyzerRepository.getAnalysis(request: scanRequest) { response in
            switch response {
            case .success(let data):
                self.scanResult = data
            case .failure(let error):
                print(error)
                print(response)
            }
            
            self.isLoading = false
        }
    }
    
    func fetchReviews() {
        if let productId = self.productData?.id {
            productRepository.getReviews(productId: productId) { result in
                switch result {
                case .success(let success):
                    self.reviews = success
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    init(productData: Product) {
        self.productData = productData
        
        if let userData = CoreDataManager.shared.fetchUserData().first {
            let skinConcerns = userData.skinConcerns?.allObjects as! [PersonalizationData]
            let skinTypes = userData.skinTypes?.allObjects as! [PersonalizationData]
            let allergens = userData.allergens?.allObjects as! [PersonalizationData]
            
            self.skinConcerns = skinConcerns
            self.skinTypes = skinTypes
            
            if let ingredients = self.productData?.ingredients {
                self.scanRequest = AnalysisRequest(
                    ingredients: ingredients,
                    concerns: skinConcerns.map({$0.name ?? ""}),
                    skinTypes: skinTypes.map({$0.name ?? ""})
                )
            }
            
            print(scanRequest)
            
            if self.scanRequest != nil {
                getAnalysis()
                fetchReviews()
            }
        }
    }
}
