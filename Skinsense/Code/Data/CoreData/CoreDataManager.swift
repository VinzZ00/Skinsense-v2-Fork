//
//  CoreDataManager.swift
//  Skinsense
//
//  Created by Rainer Regan on 13/11/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {} // Private to ensure singleton
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LocalUserData") // Replace with your data model name
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                fatalError("Error saving context: \(error)")
            }
        }
    }
    
    func saveUserData(email: String, name: String, photo: String, skinConcerns: [SkinConcern], skinTypes: [SkinType], allergens: [Allergen]) -> User? {
        do {
            let userData = User(context: viewContext)
            
            userData.id = UUID()
            userData.email = "email"
            userData.name = "Name"
            userData.photo = "photo"
            
            for type in skinTypes {
                let skinType = PersonalizationData(context: viewContext)
                skinType.name = type.name
                userData.addToSkinTypes(skinType)
            }
            
            for concern in skinConcerns {
                let skinConcern = PersonalizationData(context: viewContext)
                skinConcern.name = concern.name
                userData.addToSkinConcerns(skinConcern)
            }
            
            for allergen in allergens {
                let skinAllergen = PersonalizationData(context: viewContext)
                skinAllergen.name = allergen.name
                userData.addToAllergens(skinAllergen)
            }
            
            try viewContext.save()
            return userData
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func saveProductHistory(productData: Product) -> ProductHistory? {
        do {
            let productHistory = ProductHistory(context: viewContext)
            
            productHistory.id = UUID()
            productHistory.productId = productData.id
            productHistory.productName = productData.name
            productHistory.productPhoto = productData.photo
            
            try viewContext.save()
            return productHistory
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func updateUserData(userData: User, skinConcerns: [SkinConcern], skinTypes: [SkinType], allergens: [Allergen]) -> User?{
        do {
            userData.skinTypes = nil
            userData.skinConcerns = nil
            userData.allergens = nil
            
            for type in skinTypes {
                let skinType = PersonalizationData(context: viewContext)
                skinType.name = type.name
                userData.addToSkinTypes(skinType)
            }
            
            for concern in skinConcerns {
                let skinConcern = PersonalizationData(context: viewContext)
                skinConcern.name = concern.name
                userData.addToSkinConcerns(skinConcern)
            }
            
            for allergen in allergens {
                let skinAllergen = PersonalizationData(context: viewContext)
                skinAllergen.name = allergen.name
                userData.addToAllergens(skinAllergen)
            }
            
            try viewContext.save()
            return userData
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchUserData() -> [User] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let userData = try self.viewContext.fetch(fetchRequest)
            return userData
        } catch {
            print("Error fetching user data: \(error)")
            return []
        }
    }
    
    func fetchProductHistory() -> [ProductHistory] {
        let fetchRequest: NSFetchRequest<ProductHistory> = ProductHistory.fetchRequest()
        
        do {
            let productHistoryData = try self.viewContext.fetch(fetchRequest)
            return productHistoryData
        } catch {
            print("Error fetching product history data: \(error)")
            return []
        }
    }
    
    func clearLoggedInUserData() -> Bool {
        let userData = self.fetchUserData().first
        if userData == nil {return false}
        
        userData?.appleUserId = nil
        userData?.email = nil
        userData?.name = nil
        userData?.photo = nil
        
        do {
            try self.viewContext.save()
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func clearPersonalizationData() {
        // Step 1: Delete all managed objects for the "SavedRoutine" entity
        let entityName = "User"
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try self.persistentContainer.viewContext.execute(deleteRequest)
            
            // Step 2: Save the managed object context to commit the changes
            try self.persistentContainer.viewContext.save()
        } catch {
            print("Error clearing data for entity \(entityName): \(error)")
        }
    }
}
