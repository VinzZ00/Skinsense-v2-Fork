//
//  GeneralAttribute.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

public class GeneralAttribute: NSObject, Decodable {
    var id = UUID()
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
