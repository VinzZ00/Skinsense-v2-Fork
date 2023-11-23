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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            NavigationLink(destination: ProductResultView(viewModel: ProductResultViewModel(productData: product))) {
                HStack(spacing: 16) {
                    ProductSearchListImage(photo: product.photo)
                    VStack(alignment:.leading) {
                        Text(product.brandName ?? "-")
                            .font(.subheadline)
                        Text(product.name ?? "-")
                            .bold()
                            .multilineTextAlignment(.leading)
                    }
                    .foregroundStyle(colorScheme == .light ? Color.black : Color.white)
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
                .cornerRadius(10)
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
