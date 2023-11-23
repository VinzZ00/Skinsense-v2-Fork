//
//  CustomLabel.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 09/11/23.
//

import SwiftUI

struct CustomLabel: View {
    @Environment(\.colorScheme) var colorScheme
    
    var ingredient: Ingredient
    var onClick: () -> Void
    
    var body: some View {
        VStack{
            Button {
                onClick()
            } label: {
                Text(ingredient.name ?? "-")
                    .font(.caption)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(colorScheme == .light ? Color.lightPurple : Color.darkPurple)
            .background(colorScheme == .light ? Color.darkPurple : Color.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    CustomLabel(ingredient: Ingredient(name: "Ingredient"), onClick: {})
}
