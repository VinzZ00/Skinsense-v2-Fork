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
    var ingredients: [Ingredient]
    var totalIngredients: Int
    
    @State var progress : CGFloat = 0
    @State var showProgress = true
    
    @State var showSheet = false
    @State var selectedIngredient: Ingredient?
    
    init(title: String, ingredients: [Ingredient], totalIngredients: Int) {
        self.title = title
        self.ingredients = ingredients
        self.totalIngredients = totalIngredients
    }
    
    var body: some View {
        if ingredients.count > 0 {
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
                        .foregroundStyle(.black)
                }
                Text(title)
                    .font(.subheadline)
                WrappingHStack(alignment:.leading){
                    ForEach(ingredients, id: \.id) {
                        ing in
                        CustomLabel(ingredient: ing, onClick: {
                            self.showSheet = true
                            self.selectedIngredient = ing
                        })
                    }
                }
            }
            .padding(.bottom, 8)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .onAppear() {
                self.progress = CGFloat((Float(ingredients.count) as Float / Float(totalIngredients) as Float))
            }
            .sheet(isPresented: $showSheet, content: {
                NavigationView {
                    VStack {
                        if let ingredient = self.selectedIngredient {
                            IngredientInformationSheetView(ingredient: ingredient)
                        } else {
                            Text("No information")
                        }
                    }
                    .navigationTitle("Ingredient Detail")
                }
            })
        }
    }
}

struct IngredientInformationSheetView : View {
    var ingredient: Ingredient
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(ingredient.name ?? "-")
                    .font(.title2)
                    .bold()
                
                Text(ingredient.description ?? "-")
            }
            .padding()
            .frame(maxWidth:.infinity, alignment: .leading)
        }
    }
}

#Preview {
    IngredientInformation(title: "Ingredients are good for reducing scar", ingredients: [
        Ingredient(name: "Ing"),
    ], totalIngredients: 10)
}
