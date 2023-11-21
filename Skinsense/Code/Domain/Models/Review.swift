//
//  Review.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

struct Review: Decodable {
    var id : String
    var rating: Double
    var comment: String
    var totalLikes: Int
    var userId: String?
    var productId: String?
    var user: APIUser
    var product: Product?
    
    enum CodingKeys: String, CodingKey {
        case id, rating, comment, user, product
        case totalLikes = "total_likes"
        case userId = "user_id"
        case productId = "product_id"
    }

}
