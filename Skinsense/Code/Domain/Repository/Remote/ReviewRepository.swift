//
//  ReviewRepository.swift
//  Skinsense
//
//  Created by Rainer Regan on 21/11/23.
//

import Foundation

class ReviewRepository {
    private let dataSource: ReviewDataSource = ReviewDataSource()
    
    func create(reviewData: Review, completion: @escaping (Result<Review, Error>) -> Void) {
        dataSource.create(reviewData: reviewData, completion: completion)
    }
}
