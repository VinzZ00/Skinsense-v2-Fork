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
    
    @StateObject var viewModel: MainAppViewModel = MainAppViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .environment(\.managedObjectContext, coreDataManager.persistentContainer.viewContext)
                .onAppear {
                    viewModel.fetchUserData()
                }
        }
    }
}

struct ContentView : View {
    @ObservedObject var viewModel: MainAppViewModel
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            if(viewModel.userData != nil) {
                MainView()
            } else {
                PersonalizationView(handleFetchUserData: viewModel.fetchUserData)
            }
        }
    }
}
