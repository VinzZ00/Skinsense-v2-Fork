//
//  PersonalizedProductView.swift
//  Skinsense
//
//  Created by Rainer Regan on 21/11/23.
//

import SwiftUI

struct CategoryGroup {
    var id: String
    var name: String
    var categories: [String]
    var icon: String?
}

struct PersonalizedProductView: View {
    @StateObject var viewModel: PersonalizedProductViewModel = PersonalizedProductViewModel()
    @State var categoryGroup: CategoryGroup
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // MARK: Selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(AppConstants.categoryGroups, id: \.name) { categoryGroup in
                            CustomCheckbox(onPress: { selected in
                                self.categoryGroup = AppConstants.categoryGroups.first(where: {$0.id == categoryGroup.id})!
                                viewModel.fetchProducts(categories: self.categoryGroup.categories)
                            }, object: GeneralAttribute(name: categoryGroup.name), isActive: self.categoryGroup.id == categoryGroup.id)
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
            viewModel.fetchProducts(categories: self.categoryGroup.categories)
        }
    }
}

#Preview {
    NavigationView {
        PersonalizedProductView(categoryGroup:CategoryGroup(id: "cleanser",name: "Cleanser", categories: [
            "Face cleanser"
        ]))
    }
}
