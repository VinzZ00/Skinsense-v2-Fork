//
//  ProductResultView.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 08/11/23.
//

import SwiftUI
import WrappingHStack

struct ProductResultView: View {
    @StateObject private var viewModel: ProductResultViewModel = ProductResultViewModel()
    
    var body: some View {
        
        if let product = viewModel.productData {
            ScrollView{
                VStack(spacing: 16){
                    InfoBox(text: "This suggestion is based on EWG certified database. We do not guarantee results, consult with your doctor prior to using any product.")
                    
                    ProductImageWithStamp(imageLink: product.photo)
                    
                    // nama product
                    HStack(spacing: 50) {
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.title2)
                                .bold()
                            Text(product.category)
                                .font(.body)
                                .foregroundColor(.customDarkGrey)
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
                        CheckListItem(isTrue: false, text: "Bad for your \(product.badForSkinType.joined(separator: ", "))")
                        CheckListItem(isTrue: false, text: "Bad for \(product.badFor.joined(separator: ", "))")
                        CheckListItem(text: "Effective for your \(product.goodForSkinType.joined(separator: ", ")) Skin")
                        if let allergens = product.allergens {
                            CheckListItem(isTrue: false, text: "We have found \(allergens.count) allergens that might not suitable for your skin")
                        }
                    }
                    
                    
                    // How to use
                    VStack(alignment:.leading, spacing: 10){
                        Text("How To Use")
                            .font(.title3)
                            .bold()
                        
                        if let incompatibleIngredients = product.incompatibleIngredients {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Incompatible with")
                                    .font(.body)
                                    .bold()
                                    .lineSpacing(15)
                                Text("Products that contains \(incompatibleIngredients.joined(separator: ","))")
                                    .font(.subheadline)
                                    .foregroundColor(.customDarkGrey)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        if let compatibleIngredients = product.compatibleIngredients {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Effective with")
                                    .font(.body)
                                    .bold()
                                    .lineSpacing(15)
                                Text("Products that contain \(compatibleIngredients.joined(separator: ", "))")
                                    .font(.subheadline)
                                    .foregroundColor(.customDarkGrey)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        if let additionalInformations = product.additionalInformations {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Additional Information")
                                    .font(.body)
                                    .bold()
                                    .lineSpacing(15)
                                Text(additionalInformations)
                                    .font(.subheadline)
                                    .foregroundColor(.customDarkGrey)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                    }
                    
                    VStack (alignment: .leading){
                        Text("Ingredients Information")
                            .font(.title3)
                            .bold()
                            .lineSpacing(15)
                        VStack(alignment:.leading){
                            Text("Ingredients are good for oily skin")
                            WrappingHStack(alignment:.leading){
                                CustomLabel(text: "Salicylic Acid")
                                CustomLabel(text: "Niacinamide")
                                CustomLabel(text: "Melaleuca Leucadendron Cajaput Oil")
                            }
                        }
                        VStack(alignment:.leading){
                            Text("Ingredients are good for reducing scar")
                            WrappingHStack(alignment:.leading){
                                CustomLabel(text: "Salicylic Acid")
                                CustomLabel(text: "Allantoin")
                            }
                        }
                        VStack(alignment:.leading){
                            Text("Ingredients are good for hydrating")
                            WrappingHStack(alignment:.leading){
                                CustomLabel(text: "Salicylic Acid")
                                CustomLabel(text: "Glycerin")
                            }
                        }
                    }
                    
                    
                    VStack{
                        HStack{
                            Text("Review")
                                .font(.title3)
                                .bold()
                            Spacer()
                            Text("See More")
                                .font(.subheadline)
                                .foregroundColor(.darkPurple)
                        }
                        Spacer()
                            .frame(height: 12)
                        ReviewComponent(name: "Rainer", skintype: "Sensitive to dry", review: "GILA SIHHH KEREN PISAN!!!", totalLikes: 50
                        )
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
