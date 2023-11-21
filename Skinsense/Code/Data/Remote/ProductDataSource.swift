//
//  ProductDataSource.swift
//  Skinsense
//
//  Created by Rainer Regan on 14/11/23.
//

import Foundation
import Alamofire

class ProductDataSource {
    let APIBASEURL = ConfigurationManager.shared.apiBaseUrl() + "product"
    
    func searchProduct(query: String ,completion: @escaping (Result<[Product], Error>) -> Void) {
        
        // Define parameters (if any)
        let parameters: [String: Any] = [
            "search": query
        ]
        
        AF.request(APIBASEURL, method: .get, parameters: parameters, encoding:URLEncoding(destination: .queryString)).responseDecodable(of: [Product].self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getReviews(productId: String ,completion: @escaping (Result<[Review], Error>) -> Void) {
        AF.request(APIBASEURL + "/\(productId)/review", method: .get, encoding:URLEncoding(destination: .queryString)).responseDecodable(of: [Review].self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getById(productId: String, completion: @escaping (Result<Product, Error>) -> Void) {
        AF.request("\(APIBASEURL)/\(productId)", method: .get, encoding:URLEncoding(destination: .queryString)).responseDecodable(of: Product.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getRecommended(categories: [String], skinTypes: [String], concerns: [String], completion: @escaping (Result<[Product], Error>) -> Void) {
        
        // Define parameters (if any)
        let parameters: [String: Any] = [
            "categories": categories,
            "skinTypes": skinTypes,
            "concerns": concerns
        ]
        
        AF.request("\(APIBASEURL)/get-recommended", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: [Product].self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
