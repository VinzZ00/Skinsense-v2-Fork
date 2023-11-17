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
    
    enum CodingKeys: String, CodingKey {
        case id, name, email
    }
}
