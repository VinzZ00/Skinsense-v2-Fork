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
    
    func saveUserData(email: String, name: String, photo: String, skinConcerns: [SkinConcern], skinTypes: [SkinType], allergens: [Allergen]) {
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
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchUserData() -> [User] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let userData = try self.viewContext.fetch(fetchRequest)
            return userData
        } catch {
            print("Error fetching saved routines: \(error)")
            return []
        }
    }
}
