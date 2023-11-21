//
//  PersonalizedProductView.swift
//  Skinsense
//
//  Created by Rainer Regan on 21/11/23.
//

import SwiftUI

struct PersonalizedProductView: View {
    @StateObject var viewModel: PersonalizedProductViewModel = PersonalizedProductViewModel()
    @State var category: String
    
    var categories = [
        "Cleanser",
        "Toner",
        "Serum",
        "Essence",
        "Moisturizer",
        "Sunscreen",
        "Face Mask",
        "Exfoliator",
        "Makeup Remover"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // MARK: Selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            CustomCheckbox(onPress: { selected in
                                self.category = selected.name
                                viewModel.fetchProducts(category: selected.name)
                            }, object: GeneralAttribute(name: category), isActive: self.category == category)
                        }
                    }
                }
                
                VStack {
                    if let products = viewModel.products {
                        if products.count > 0 {
                            ScrollView {
                                ForEach(products, id: \.id) {
                                    product in
                                    ProductSearchListItem(product: product)
                                }
                            }
                        } else {
                            CustomEmptyView(title: "Not Found", subTitle: "There are no products that are suitable for you")
                        }
                    } else {
                        ProgressView()
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Personalized Product")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchProducts(category: self.category)
        }
    }
}

#Preview {
    NavigationView {
        PersonalizedProductView(category: "Serum")
    }
}
