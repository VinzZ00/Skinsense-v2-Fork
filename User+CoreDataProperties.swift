//
//  User+CoreDataProperties.swift
//  Skinsense
//
//  Created by Rainer Regan on 13/11/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var allergens: [GeneralAttribute]?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var photo: String?
    @NSManaged public var skinConcerns: [GeneralAttribute]?
    @NSManaged public var skinTypes: [GeneralAttribute]?

}

extension User : Identifiable {

}
