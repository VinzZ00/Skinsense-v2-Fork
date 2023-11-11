//
//  ForYouTabView.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 11/11/23.
//

import SwiftUI
import WrappingHStack

struct ForYouTabView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("For You")
                .font(.largeTitle)
                .bold()
            
            VStack{
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
        }
    }
}

#Preview {
    ForYouTabView()
}
