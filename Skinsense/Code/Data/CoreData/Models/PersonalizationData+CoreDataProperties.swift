//
//  PersonalizationData+CoreDataProperties.swift
//  Skinsense
//
//  Created by Rainer Regan on 13/11/23.
//
//

import Foundation
import CoreData


extension PersonalizationData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonalizationData> {
        return NSFetchRequest<PersonalizationData>(entityName: "PersonalizationData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: User?

}

extension PersonalizationData : Identifiable {

}
