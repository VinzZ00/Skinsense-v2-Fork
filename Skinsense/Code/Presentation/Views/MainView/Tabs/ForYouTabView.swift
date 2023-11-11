//
//  ForYouTabView.swift
//  Skinsense
//
//  Created by Rainer Regan on 11/11/23.
//

import SwiftUI

struct ForYouTabView: View {
    @State var searchText: String = ""
    @State var showSearch: Bool = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading) {
                        Text("Your personalized product")
                            .font(.title3)
                            .bold()
                        
                        // TODO: Integrate punya ines
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Recently Scanned")
                            .font(.title3)
                            .bold()
                        
                        VStack {
                            // TODO: Integrate from inez-buset
                        }
                        
                    }
                }
                .padding()
                .navigationTitle("For You")
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    NavigationView {
        ForYouTabView()
    }
}
