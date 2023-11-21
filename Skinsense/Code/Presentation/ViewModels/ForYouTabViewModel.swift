//
//  ForYouTabViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 14/11/23.
//

import Foundation

class ForYouTabViewModel : ObservableObject {
    @Published var searchText: String = ""
    @Published var showSearch: Bool = true
    @Published var isLoading: Bool = false
    @Published var searchedProduct: [Product] = []
    @Published var productHistory: [ProductHistory]?
    
    private var productRepository: ProductRepository = ProductRepository()
    
    func searchProduct(query: String) {
        self.isLoading = true
        productRepository.searchProduct(query: query) { res in
            switch res {
            case .success(let data):
                self.searchedProduct = data
            case .failure(let failure):
                self.searchedProduct = []
                print(failure)
            }
            self.isLoading = false
        }
    }
    
    func fetchProductHistory() {
        let productHistory = CoreDataManager.shared.fetchProductHistory()
        self.productHistory = productHistory
    }
}
