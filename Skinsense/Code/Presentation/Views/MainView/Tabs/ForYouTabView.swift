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
                        WrappingHStack(alignment: .leading, horizontalSpacing: 10){
                    PersonalizedProductIcon(text: "Cleanser", icon2: "FacialFoam")
                    PersonalizedProductIcon(text: "Toner", icon2: "Toner")
                    PersonalizedProductIcon(text: "Serum", icon2: "Serum")
                    PersonalizedProductIcon(text: "Moisturizer", icon2: "Moisturizer")
                }
                WrappingHStack(alignment: .leading, horizontalSpacing: 10){
                    PersonalizedProductIcon(text: "Exfoliator", icon2: "Exfo")
                    PersonalizedProductIcon(text: "Sun Screen", icon2: "Sunscreen")
                    PersonalizedProductIcon(text: "Face Mask", icon2: "faceMask")
                    PersonalizedProductIcon(text: "Others", icon2: "Others")
                }
                Spacer()
                    .frame(height: 25)
                        
                VStack(alignment: .leading){
                    Text("Recently Scanned")
                        .font(.title3)
                        .bold()
                    NavigationLink(destination: MainView()) {
                        HStack {
                            Text("Scanned Product #1")
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.customDarkGrey)
                        }
                        .padding()
                    }
                    
                }
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
