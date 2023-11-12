//
//  ProductResultView.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 08/11/23.
//

import SwiftUI
import WrappingHStack

struct ProductResultView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel: ProductResultViewModel = ProductResultViewModel()
    
    var body: some View {
        if let product = viewModel.productData {
            ScrollView{
                VStack(spacing: 24){
                    InfoBox(text: "This suggestion is based on EWG certified database. We do not guarantee results, consult with your doctor prior to using any product.")
                    
                    ProductImageWithStamp(imageLink: product.photo ?? "image")
                    
                    // nama product
                    HStack(spacing: 50) {
                        VStack(alignment: .leading) {
                            Text(product.name ?? "Product Name")
                                .font(.title2)
                                .bold()
                            Text(product.categoryName ?? "{CATEGORY}")
                                .font(.body)
                                .foregroundColor(colorScheme == .light ? .customDarkGrey : .bgColor)
                        }
                        Spacer()
                        BookmarkButton { state in
                            print(state)
                        }
                    }
                    
                    //tingkat ke-efektifan
                    InfoBox(
                        text: "Based on your personalization, the product's effectiveness level is 70.3%",
                        type: .success, showIcon: false
                    )
                    
                    // Point-point
                    VStack(alignment:.leading, spacing: 10){
                        if let badForSkinType = product.badForSkinType {
                            CheckListItem(isTrue: false, text: "Bad for your \(badForSkinType.joined(separator: ", "))")
                        }
                        
                        if let badFor = product.badFor {
                            CheckListItem(isTrue: false, text: "Bad for \(badFor.joined(separator: ", "))")
                        }
                        
                        if let goodForSkinType = product.goodForSkinType {
                            CheckListItem(text: "Effective for your \(goodForSkinType.joined(separator: ", ")) Skin")
                        }
                        
                        if let allergens = product.allergens {
                            CheckListItem(isTrue: false, text: "We have found \(allergens.count) allergens that might not suitable for your skin")
                        }
                    }
                    
                    Divider()
                    
                    // How to use
                    VStack(alignment:.leading, spacing: 10){
                        Text("How To Use")
                            .font(.title3)
                            .bold()
                        
                        if let incompatibleIngredients = product.incompatibleIngredients {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Incompatible with")
                                    .font(.body)
                                    .lineSpacing(15)
                                Text("Products that contains \(incompatibleIngredients.joined(separator: ","))")
                                    .font(.subheadline)
                                    .foregroundColor(colorScheme == .light ? .customDarkGrey : .bgColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        if let compatibleIngredients = product.compatibleIngredients {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Effective with")
                                    .font(.body)
                                    .lineSpacing(15)
                                Text("Products that contain \(compatibleIngredients.joined(separator: ", "))")
                                    .font(.subheadline)
                                    .foregroundColor(colorScheme == .light ? .customDarkGrey : .bgColor)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        if let additionalInformations = product.additionalInformations {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Additional Information")
                                    .font(.body)
                                    .lineSpacing(15)
                                Text(additionalInformations)
                                    .font(.subheadline)
                                    .foregroundColor(colorScheme == .light ? .customDarkGrey : .bgColor)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                    }
                    
                    Divider()
                    
                    // Ingredients Information
                    VStack (alignment: .leading, spacing: 10){
                        VStack(alignment: .leading) {
                            Text("Ingredients Information")
                                .font(.title3)
                                .bold()
                        }
                        
                        // Ingredients Information Components
                        VStack(spacing: 8) {
                            IngredientInformation(title: "Ingredients are good for reducing scar", ingredients: [
                                "Ok",
                                "CKJ"
                            ])
                            IngredientInformation(title: "Ingredients are good for hydrating", ingredients: [
                                "Ok",
                                "CKJ"
                            ])
                        }
                        
                    }
                    
                    Divider()
                    
                    // Review
                    VStack(spacing: 15){
                        HStack{
                            Text("Review")
                                .font(.title3)
                                .bold()
                            Spacer()
                            Text("See More")
                                .font(.subheadline)
                                .foregroundColor(colorScheme == .light ? .darkPurple : .mediumPurple)
                        }
                        
                        if let review = product.reviews?.first {
                            ReviewComponent(review: review)
                        }
                    }
                }
            }
            .padding()
        } else {
            EmptyView()
        }
    }
}


#Preview {
    ProductResultView()
}
