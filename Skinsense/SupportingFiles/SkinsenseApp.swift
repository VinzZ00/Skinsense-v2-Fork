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
                .environmentObject(viewModel)
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
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.3)))
            } else {
                PersonalizationView(callback: { user in
                    print(user)
                    viewModel.fetchUserData()
                }).transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.3)))
            }
        }
    }
}
