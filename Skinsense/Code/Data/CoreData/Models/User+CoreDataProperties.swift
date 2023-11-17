//
//  User+CoreDataProperties.swift
//  Skinsense
//
//  Created by Rainer Regan on 17/11/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var photo: String?
    @NSManaged public var appleUserId: String?
    @NSManaged public var allergens: NSSet?
    @NSManaged public var skinConcerns: NSSet?
    @NSManaged public var skinTypes: NSSet?

}

// MARK: Generated accessors for allergens
extension User {

    @objc(addAllergensObject:)
    @NSManaged public func addToAllergens(_ value: PersonalizationData)

    @objc(removeAllergensObject:)
    @NSManaged public func removeFromAllergens(_ value: PersonalizationData)

    @objc(addAllergens:)
    @NSManaged public func addToAllergens(_ values: NSSet)

    @objc(removeAllergens:)
    @NSManaged public func removeFromAllergens(_ values: NSSet)

}

// MARK: Generated accessors for skinConcerns
extension User {

    @objc(addSkinConcernsObject:)
    @NSManaged public func addToSkinConcerns(_ value: PersonalizationData)

    @objc(removeSkinConcernsObject:)
    @NSManaged public func removeFromSkinConcerns(_ value: PersonalizationData)

    @objc(addSkinConcerns:)
    @NSManaged public func addToSkinConcerns(_ values: NSSet)

    @objc(removeSkinConcerns:)
    @NSManaged public func removeFromSkinConcerns(_ values: NSSet)

}

// MARK: Generated accessors for skinTypes
extension User {

    @objc(addSkinTypesObject:)
    @NSManaged public func addToSkinTypes(_ value: PersonalizationData)

    @objc(removeSkinTypesObject:)
    @NSManaged public func removeFromSkinTypes(_ value: PersonalizationData)

    @objc(addSkinTypes:)
    @NSManaged public func addToSkinTypes(_ values: NSSet)

    @objc(removeSkinTypes:)
    @NSManaged public func removeFromSkinTypes(_ values: NSSet)

}

extension User : Identifiable {

}
