//
//  User.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import Foundation

struct User {
    var id: String
    var name: String
    var email: String
    var photo: String
    var skinTypes: [SkinType]
    var skinConcerns: [SkinConcern]
    var allergens: [Allergen]
}
