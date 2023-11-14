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
    @StateObject var viewModel: ProductResultViewModel
    
    var body: some View {
        if let product = viewModel.productData {
            if viewModel.isLoading {
                ProgressView()
            } else {
                if let scanResult = viewModel.scanResult {
                    ScrollView {
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
                            
                            // Effectiveness
                            InfoBox(text: "Based on your personalization, the product's effectiveness level is \(round(scanResult.percentage ?? 0))%",
                                    type: (scanResult.percentage ?? 0) < 60 ? .danger : .success, showIcon: false)
                            
                            // MARK: - Point-point
                            VStack(alignment:.leading, spacing: 10){
                                
                                if let skinTypes = viewModel.skinTypes {
                                    let intersecting = skinTypes.filter { test in
                                        if let name = test.name {
                                            return scanResult.goodForSkinType.contains(name)
                                        } else {
                                            return false
                                        }
                                    }
                                    
                                    if(!intersecting.isEmpty) {
                                        CheckListItem(text: "Effective for your \(intersecting.map({$0.name ?? ""}).joined(separator: ", ")) Skin")
                                    }
                                }
                                
                                if let skinTypes = viewModel.skinTypes {
                                    let intersecting = skinTypes.filter { test in
                                        if let name = test.name {
                                            return scanResult.badForSkinType.contains(name)
                                        } else {
                                            return false
                                        }
                                    }
                                    
                                    if(!intersecting.isEmpty) {
                                        CheckListItem(isTrue: false, text: "Bad for your \(intersecting.map({$0.name ?? ""}).joined(separator: ", ")) skin")
                                    }
                                }
                                
                                if let concerns = viewModel.skinConcerns {
                                    let intersecting = concerns.filter { test in
                                        if let name = test.name {
                                            return scanResult.goodFor.contains(name)
                                        } else {
                                            return false
                                        }
                                    }
                                    
                                    if(!intersecting.isEmpty) {
                                        CheckListItem(text: "Good for \(intersecting.map({$0.name ?? ""}).joined(separator: ", ")) problems")
                                    }
                                }
                                
                                if let concerns = viewModel.skinConcerns {
                                    let intersecting = concerns.filter { test in
                                        if let name = test.name {
                                            return scanResult.badFor.contains(name)
                                        } else {
                                            return false
                                        }
                                    }
                                    
                                    if(!intersecting.isEmpty) {
                                        CheckListItem(isTrue: false, text: "Bad for \(intersecting.map({$0.name ?? ""}).joined(separator: ", ")) problems")
                                    }
                                }
                                
                                if let allergens = scanResult.allergens {
                                    CheckListItem(isTrue: false, text: "We have found \(allergens.count) allergens that might not suitable for your skin")
                                }
                            }
                            
                            Divider()
                            
                            // MARK: - How to use
                            VStack(alignment:.leading, spacing: 10){
                                Text("How To Use")
                                    .font(.title3)
                                    .bold()
                                
                                if let incompatibleIngredients = scanResult.incompatibleIngredients {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Incompatible with")
                                            .font(.body)
                                            .fontWeight(.semibold)
                                            .lineSpacing(15)
                                        
                                        if incompatibleIngredients.isEmpty {
                                            Text("-")
                                                .font(.subheadline)
                                                .foregroundColor(colorScheme == .light ? .customDarkGrey : .bgColor)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        } else {
                                            Text("Products that contains \(incompatibleIngredients.joined(separator: ","))")
                                                .font(.subheadline)
                                                .foregroundColor(colorScheme == .light ? .customDarkGrey : .bgColor)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                    }
                                }
                                
                                if let compatibleIngredients = scanResult.compatibleIngredients {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Effective with")
                                            .font(.body)
                                            .fontWeight(.semibold)
                                            .lineSpacing(15)
                                        Text("Products that contain \(compatibleIngredients.joined(separator: ", "))")
                                            .font(.subheadline)
                                            .foregroundColor(colorScheme == .light ? .customDarkGrey : .bgColor)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                
                                if let additionalDescriptions = scanResult.additionalDescriptions{
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Additional Information")
                                            .font(.body)
                                            .fontWeight(.semibold)
                                            .lineSpacing(15)
                                        
                                        if(additionalDescriptions.isEmpty) {
                                            Text("-")
                                                .font(.subheadline)
                                                .foregroundColor(colorScheme == .light ? .customDarkGrey : .bgColor)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        } else {
                                            ForEach(additionalDescriptions, id: \.self) {
                                                information in
                                                
                                                Text("- \(information)")
                                                    .font(.subheadline)
                                                    .foregroundColor(colorScheme == .light ? .customDarkGrey : .bgColor)
                                                    .fixedSize(horizontal: false, vertical: true)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                        }
                                        
                                    }
                                }
                                
                            }
                            
                            Divider()
                            
                            // MARK: - Ingredients Information
                            VStack (alignment: .leading, spacing: 10){
                                VStack(alignment: .leading) {
                                    Text("Ingredients Information")
                                        .font(.title3)
                                        .bold()
                                }
                                
                                // Ingredients Information Components
                                if let concerns = viewModel.scanRequest?.concerns {
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        if concerns.isEmpty {
                                            Text("-")
                                        } else {
                                            ForEach(concerns, id:\.self) {
                                                concern in
                                                IngredientInformation(
                                                    title: "Ingredients are good for reducing \(concern)",
                                                    ingredients: viewModel.scanResult?.ingredients?.filter({ ing in
                                                        ing.getIngredientGoodFor().contains { test in
                                                            test == concern
                                                        }
                                                    }).map({ el in
                                                        el.name
                                                    }) as! [String]
                                                )
                                            }
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                                
                            }
                            
                            Divider()
                            
                            // MARK: - TODO: Review
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
                    .navigationTitle("Product Information")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        } else {
            CustomEmptyView(title: "Product Not Found", subTitle: "Product not found")
        }
    }
}


#Preview {
    ProductResultView(viewModel: ProductResultViewModel(productData: Product(ingredients: "Water, Salicylic Acid")))
}
