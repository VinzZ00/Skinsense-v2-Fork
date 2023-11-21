//
//  PeronalizedProductIcon.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 11/11/23.
//

import SwiftUI

struct PersonalizedProductIcon: View {
    @Environment(\.colorScheme) var colorScheme
    
    var categoryGroup: CategoryGroup
    var icon: String
    
    var body: some View {
        NavigationLink(destination: PersonalizedProductView(categoryGroup: categoryGroup)){
            VStack(alignment: .center, spacing: 5){
                ZStack{
                    Image("bgICON")
                        .frame(width: 63, height: 63)
                    Image(icon)
                        .frame(width: 42, height: 42)
                }
                Text(categoryGroup.name)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(colorScheme == .light ? .darkPurple : .lightPurple)
            }
        }
    }
}

#Preview {
    PersonalizedProductIcon(categoryGroup: CategoryGroup(id: "Category", name: "Category", categories: []), icon: "FacialFoam")
}
