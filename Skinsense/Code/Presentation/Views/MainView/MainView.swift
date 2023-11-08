//
//  MainView.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import SwiftUI


struct MainView: View {
    var body: some View {
        TabView {
            Text("For You")
                .tabItem {
                    Label("For You", systemImage: "heart.fill")
                }
            ScanTab()
                .tabItem {
                    Label("Scan", systemImage: "camera.viewfinder")
                }
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
