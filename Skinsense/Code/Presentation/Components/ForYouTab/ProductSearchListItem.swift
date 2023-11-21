//
//  ProductSearchListItem.swift
//  Skinsense
//
//  Created by Rainer Regan on 14/11/23.
//

import SwiftUI
import Kingfisher

struct ProductSearchListItem: View {
    var product: Product
    
    var body: some View {
        VStack {
            NavigationLink(destination: ProductResultView(viewModel: ProductResultViewModel(productData: product))) {
                HStack(spacing: 16) {
                    ProductSearchListImage(photo: product.photo)
                    VStack(alignment:.leading) {
                        Text(product.brandName ?? "-")
                            .bold()
                        Text(product.name ?? "-")
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Divider()
        }
    }
}

struct ProductSearchListImage :View {
    var photo: String?
    
    var body: some View {
        if let photo = self.photo {
            KFImage(URL(string: photo))
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100, alignment: .center)
                .clipped()
        } else {
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100, alignment: .center)
                .clipped()
        }
    }
}

#Preview {
    ProductSearchListItem(product: Product(name: "ProductName", brandName: "Brand name"))
}
