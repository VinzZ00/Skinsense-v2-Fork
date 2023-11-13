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
                    
                    if let similarProduct = scanResult.similarProducts?.first {
                        // Is this your product
                        VStack(alignment: .leading) {
                            Text("Is this your product?")
                                .font(.headline)
                                .bold()
                            
                            NavigationLink(destination: ProductResultView()) {
                                HStack {
                                    ProductImageWithStamp(imageLink: similarProduct.photo ?? "placeholder", imageSize:.small)
                                    
                                    Text(similarProduct.name ?? "Product Name")
                                    
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
                        VStack {
                            Text("Scan result")
                                .font(.title2)
                                .bold()
                            Text("ID: \(scanResult.id ?? 0)")
                                .font(.caption)
                                .foregroundStyle(Color.gray)
                        }
                        Spacer()
                        BookmarkButton { state in
                            print(state)
                        }
                    }
                    
                    // Effectiveness
                    InfoBox(text: "Based on your personalization, the product's effectiveness level is \(scanResult.percentage ?? 0)%",
                            type: (scanResult.percentage ?? 0) < 60 ? .danger : .success, showIcon: false)
                    
                    // Points
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
                    
                    // How to use
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
                                    .lineSpacing(15)
                                
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
                    
                    Divider()
                    
                    // Ingredients Information
                    VStack (alignment: .leading, spacing: 10){
                        VStack(alignment: .leading) {
                            Text("Ingredients Information")
                                .font(.title3)
                                .bold()
                        }
                        
                        // Ingredients Information Components
                        if let concerns = viewModel.scanRequest?.concerns {
                            VStack(spacing: 8) {
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
    ScanResultView(viewModel: ScanResultViewModel(
        scannedData: [
            ScanData(content: "Salicylic Acid"),
            ScanData(content: "Melaleuca Alternifolia Leaf Oil"),
            ScanData(content: "Calophyllum Inophyllum Seed Oil"),
            ScanData(content: "Tocopherol")
        ]
    ))
}
