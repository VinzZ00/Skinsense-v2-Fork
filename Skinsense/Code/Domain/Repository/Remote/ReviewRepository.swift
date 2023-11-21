//
//  ReviewRepository.swift
//  Skinsense
//
//  Created by Rainer Regan on 21/11/23.
//

import Foundation

class ReviewRepository {
    private let dataSource: ReviewDataSource = ReviewDataSource()
    
    static let shared = ReviewDataSource()
    
    init() {} // Private to ensure singleton
    
    func create(reviewData: Review, completion: @escaping (Result<Review, Error>) -> Void) {
        dataSource.create(reviewData: reviewData, completion: completion)
    }
    
    func addLike(reviewId: String, completion: @escaping (Result<Review, Error>) -> Void) {
        dataSource.addLike(reviewId: reviewId, completion: completion)
    }
}
