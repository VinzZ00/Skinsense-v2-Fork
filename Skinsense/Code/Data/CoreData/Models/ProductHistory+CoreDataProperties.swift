//
//  ProductHistory+CoreDataProperties.swift
//  Skinsense
//
//  Created by Rainer Regan on 21/11/23.
//
//

import Foundation
import CoreData


extension ProductHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductHistory> {
        return NSFetchRequest<ProductHistory>(entityName: "ProductHistory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var productId: String?
    @NSManaged public var productName: String?
    @NSManaged public var productPhoto: String?

}

extension ProductHistory : Identifiable {

}
