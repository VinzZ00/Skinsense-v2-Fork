//
//  ScanHistory+CoreDataProperties.swift
//  Skinsense
//
//  Created by Rainer Regan on 23/11/23.
//
//

import Foundation
import CoreData


extension ScanHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScanHistory> {
        return NSFetchRequest<ScanHistory>(entityName: "ScanHistory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var jsonString: String?

}

extension ScanHistory : Identifiable {

}
