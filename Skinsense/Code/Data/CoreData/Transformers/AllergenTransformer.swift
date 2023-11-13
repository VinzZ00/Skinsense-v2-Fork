//
//  AllergenTransformer.swift
//  Skinsense
//
//  Created by Rainer Regan on 13/11/23.
//

import Foundation

//class AllergenTransformer : ValueTransformer {
//    override func transformedValue(_ value: Any?) -> Any? {
//        guard let allergens = value as? [Allergen] else { return nil }
//        
//        do {
//            let data = try NSKeyedArchiver.archivedData(withRootObject: allergens, requiringSecureCoding: false)
//            return data
//        } catch {
//            return nil
//        }
//    }
//    
//    override func reverseTransformedValue(_ value: Any?) -> Any? {
//        guard let data = value as? Data else { return nil }
//        
//        do {
//            let allergens = try NSKeyedUnarchiver.unarchivedObject(ofClass: [Allergen].self, from: data)
//            
//        } catch {
//            return nil
//        }
//    }
//}
