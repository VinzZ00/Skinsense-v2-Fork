//
//  SkinsenseApp.swift
//  Skinsense
//
//  Created by Rainer Regan on 02/11/23.
//

import SwiftUI
import CoreData

@main
struct SkinsenseApp: App {
    let coreDataManager = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.persistentContainer.viewContext)
                .onAppear {
                    let userData = coreDataManager.fetchUserData()
                    print(userData)
                }
        }
    }
}

struct ContentView : View {
    @State var userData: User?
    
    var body: some View {
        if(userData != nil) {
            MainView()
        } else {
            PersonalizationView()
        }
    }
}
