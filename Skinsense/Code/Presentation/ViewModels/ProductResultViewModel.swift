//
//  ProductResultViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

class ProductResultViewModel: ObservableObject {
    private var repository: MockProductRepository = MockProductRepository()
    
    @Published var productData: Product? = nil
    
    init() {
        self.fetchProductData()
    }
    
    func fetchProductData() {
        repository.fetchData { products in
            self.productData = products.first
        }
    }
}
