//
//  MainView.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import SwiftUI


struct MainView: View {
    var body: some View {
        NavigationView {
            TabView {
                Text("For You")
                    .tabItem {
                        Label("For You", systemImage: "heart.fill")
                    }
                ScanTabView()
                    .tabItem {
                        Label("Scan", systemImage: "camera.viewfinder")
                    }
                ProfileTabView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
