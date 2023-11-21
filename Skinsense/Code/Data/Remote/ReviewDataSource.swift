//
//  ReviewDataSource.swift
//  Skinsense
//
//  Created by Rainer Regan on 20/11/23.
//

import Foundation
import Alamofire

class ReviewDataSource {
    let APIBASEURL = ConfigurationManager.shared.apiBaseUrl() + "review"
    
    func create(reviewData: Review, completion: @escaping (Result<Review, Error>) -> Void) {
        // Define parameters (if any)
        let parameters: [String: Any] = [
            "rating": reviewData.rating,
            "comment": reviewData.comment,
            "total_likes": reviewData.totalLikes,
            "user_id": reviewData.user.id,
            "product_id": reviewData.product?.id
        ]
        
        AF.request(APIBASEURL, method: .post, parameters: parameters, encoding:JSONEncoding.default).responseDecodable(of: Review.self) { response in
            print(response)
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func addLike(reviewId: String, completion: @escaping (Result<Review, Error>) -> Void) {
        AF.request("\(APIBASEURL)/\(reviewId)/addLike", method: .post, encoding:JSONEncoding.default)
            .responseDecodable(of: Review.self) { response in
            print(response)
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
