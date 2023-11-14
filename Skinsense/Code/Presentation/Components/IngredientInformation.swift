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
    var totalIngredients: Int
    
    @State var progress : CGFloat = 0
    @State var showProgress = true
    
    init(title: String, ingredients: [String], totalIngredients: Int) {
        self.title = title
        self.ingredients = ingredients
        self.totalIngredients = totalIngredients
    }
    
    var body: some View {
        VStack(alignment:.leading){
            ZStack {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.lightGrey)
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.mediumPurple)
                            .frame(width: min(max(geometry.size.width * progress, 0), geometry.size.width))
                            .animation(.easeIn, value: progress)
                    }
                }
                .frame(height: 26)
                Text("\(ingredients.count) out of \(totalIngredients)")
                    .font(.subheadline)
            }
            Text(title)
            WrappingHStack(alignment:.leading){
                ForEach(ingredients, id: \.self) {
                    ing in
                    CustomLabel(text: ing)
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .onAppear() {
            self.progress = CGFloat((Float(ingredients.count) as Float / Float(totalIngredients) as Float))
        }
    }
}

#Preview {
    IngredientInformation(title: "Ingredients are good for reducing scar", ingredients: ["Salicilic Acid", "Acid"], totalIngredients: 10)
}
