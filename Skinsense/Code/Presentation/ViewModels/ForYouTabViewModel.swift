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
    @Published var searchedProduct: [Product] = []
    
    private var productRepository: ProductRepository = ProductRepository()
    
    func searchProduct(query: String) {
        productRepository.searchProduct(query: query) { res in
            switch res {
            case .success(let data):
                self.searchedProduct = data
                print(data)
            case .failure(let failure):
                self.searchedProduct = []
                print(failure)
            }
        }
    }
}
