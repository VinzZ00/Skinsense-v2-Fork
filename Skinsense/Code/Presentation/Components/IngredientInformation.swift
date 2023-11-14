//
//  IngredientInformation.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import SwiftUI
import WrappingHStack

struct IngredientInformation: View {
    var title: String
    var ingredients: [String]
    
    var body: some View {
        VStack(alignment:.leading){
            Text(title)
            WrappingHStack(alignment:.leading){
                ForEach(ingredients, id: \.self) {
                    ing in
                    CustomLabel(text: ing)
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}

#Preview {
    IngredientInformation(title: "Ingredients are good for reducing scar", ingredients: ["Salicilic Acid", "Acid"])
}
