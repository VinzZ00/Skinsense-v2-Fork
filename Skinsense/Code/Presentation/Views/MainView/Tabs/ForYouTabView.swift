//
//  ForYouTabView.swift
//  Skinsense
//
//  Created by Rainer Regan on 11/11/23.
//

import SwiftUI
import WrappingHStack

struct ForYouTabView: View {
    @State var searchText: String = ""
    @State var showSearch: Bool = true
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Your personalized product")
                            .font(.title3)
                            .bold()
                        
                        LazyVGrid (columns: columns) {
                            PersonalizedProductIcon(text: "Cleanser", icon2: "FacialFoam")
                            PersonalizedProductIcon(text: "Toner", icon2: "Toner")
                            PersonalizedProductIcon(text: "Serum", icon2: "Serum")
                            PersonalizedProductIcon(text: "Moisturizer", icon2: "Moisturizer")
                            PersonalizedProductIcon(text: "Exfoliator", icon2: "Exfo")
                            PersonalizedProductIcon(text: "Sun Screen", icon2: "Sunscreen")
                            PersonalizedProductIcon(text: "Face Mask", icon2: "faceMask")
                            PersonalizedProductIcon(text: "Others", icon2: "Others")
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Recently Scanned")
                            .font(.title3)
                            .bold()
                        
                        VStack {
                            // TODO: Integrate from inez-buset
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
