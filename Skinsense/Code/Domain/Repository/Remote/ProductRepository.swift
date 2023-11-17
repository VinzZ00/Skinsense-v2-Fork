//
//  ProductRepository.swift
//  Skinsense
//
//  Created by Rainer Regan on 14/11/23.
//

import Foundation

class ProductRepository {
    private let dataSource: ProductDataSource = ProductDataSource()
    
    func searchProduct(query: String ,completion: @escaping (Result<[Product], Error>) -> Void) {
        dataSource.searchProduct(query: query, completion: completion)
    }
}
