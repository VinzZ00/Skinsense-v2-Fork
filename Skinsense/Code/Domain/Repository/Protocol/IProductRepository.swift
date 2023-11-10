//
//  IProductRepository.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

protocol IProductRepository {
    func fetchData(completion: @escaping ([Product]) -> Void)
}
