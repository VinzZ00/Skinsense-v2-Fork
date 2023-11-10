//
//  IngredientsResultView.swift
//  Skinsense
//
//  Created by Rainer Regan on 09/11/23.
//

import SwiftUI

struct ScanResultView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel : ScanResultViewModel
    
    var body: some View {
        if let scanResult = viewModel.scanResult {
            ScrollView {
                VStack(alignment:.leading, spacing: 15) {
                    InfoBox(text: "This suggestion is based on EWG certified database. We do not guarantee results, consult with your doctor prior to using any product.")
                    
                    if let similarProduct = scanResult.similarProduct {
                        // Is this your product
                        VStack(alignment: .leading) {
                            Text("Is this your product?")
                                .font(.headline)
                                .bold()
                            
                            NavigationLink(destination: ProductResultView()) {
                                HStack {
                                    ProductImageWithStamp(imageLink: similarProduct.photo, imageSize:.small)
                                    
                                    Text(similarProduct.name)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .padding()
                                .background(colorScheme == .light ? Color.white : Color.customDarkGrey)
                                .cornerRadius(10)
                            }
                            
                        }
                    }
                    
                    // Name
                    HStack(spacing: 20) {
                        Text("Scan result \(scanResult.id)")
                            .font(.title2)
                            .bold()
                        Spacer()
                        BookmarkButton { state in
                            print(state)
                        }
                    }
                    
                    // Effectiveness
                    InfoBox(text: "Based on your personalization, the product's effectiveness level is 70.3%", type: .success, showIcon: false)
                    
                    // Points
                    VStack(alignment:.leading, spacing: 10){
                        CheckListItem(isTrue: false, text: "Bad for your \(scanResult.badForSkinType.joined(separator: ", "))")
                        CheckListItem(isTrue: false, text: "Bad for \(scanResult.badFor.joined(separator: ", "))")
                        CheckListItem(text: "Effective for your \(scanResult.goodForSkinType.joined(separator: ", ")) Skin")
                        if let allergens = scanResult.allergens {
                            CheckListItem(isTrue: false, text: "We have found \(allergens.count) allergens that might not suitable for your skin")
                        }
                    }
                    
                    Divider()
                    
                    // How to use
                    VStack(alignment:.leading, spacing: 10){
                        Text("How To Use")
                            .font(.title3)
                            .bold()
                        
                        if let incompatibleIngredients = scanResult.incompatibleIngredients {
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
                        
                        if let compatibleIngredients = scanResult.compatibleIngredients {
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
                        
                        if let additionalInformations = scanResult.additionalInformations {
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
                    
                    
                }
                .padding()
                .navigationTitle("Product Information")
            }
        } else {
            VStack(spacing: 15) {
                Image("not_found")
                Text("We Couldn't Retrieve the Information")
                    .font(.title3)
                    .bold()
                Text("Please ensure that you scan skincare ingredients.")
                    .frame(maxWidth: 200)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    ScanResultView(viewModel: ScanResultViewModel(scannedData: [ScanData(content: "Glycerin"), ScanData(content: "Salycylic Acid")]))
}
