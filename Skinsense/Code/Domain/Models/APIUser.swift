//
//  APIUser.swift
//  Skinsense
//
//  Created by Rainer Regan on 17/11/23.
//

import Foundation

struct APIUser : Decodable {
    var id: String
    var name: String?
    var email: String?
    var skinTypes: String?
    var skinConcerns: String?
    var allergens: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, allergens
        case skinTypes = "skin_types"
        case skinConcerns = "skin_concerns"
    }
}
