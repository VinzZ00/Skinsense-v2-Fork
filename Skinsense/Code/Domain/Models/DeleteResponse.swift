//
//  DeleteResponse.swift
//  Skinsense
//
//  Created by Rainer Regan on 22/11/23.
//

import Foundation

struct DeleteResponse : Decodable{
    var status: Bool
    enum CodingKeys: String, CodingKey {
        case status
    }
}
