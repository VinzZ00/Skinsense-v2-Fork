//
//  PeronalizedProductIcon.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 11/11/23.
//

import SwiftUI

struct PersonalizedProductIcon: View {
    var text: String
    var icon2: String

    
    var body: some View {
        NavigationLink(destination: MainView()){
            VStack(alignment: .center, spacing: 5){
                ZStack{
                    Image("bgICON")
                        .frame(width: 63, height: 63)
                    Image(icon2)
                        .frame(width: 42, height: 42)
                }
                Text(text)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.darkPurple)
            }
            .frame(width: 90)
        }
    }
}

#Preview {
    PersonalizedProductIcon(text: "Cleanser", icon2: "FacialFoam")
}
