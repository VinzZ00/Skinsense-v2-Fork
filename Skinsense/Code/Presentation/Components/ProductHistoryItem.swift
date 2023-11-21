//
//  ProductHistoryItem.swift
//  Skinsense
//
//  Created by Rainer Regan on 21/11/23.
//

import SwiftUI
import Kingfisher

struct ProductHistoryItem: View {
    var productHistory: ProductHistory
    var productRepository: ProductRepository = ProductRepository()
    
    @State var productData: Product?
    
    func fetchProductData() {
        if let productId = self.productHistory.productId {
            productRepository.getById(productId: productId) { result in
                switch result {
                case .success(let success):
                    self.productData = success
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            if let productData = self.productData {
                VStack {
                    NavigationLink(destination: ProductResultView(viewModel: ProductResultViewModel(productData: productData))) {
                        HStack(spacing: 16) {
                            ProductSearchListImage(photo: productData.photo)
                            VStack(alignment:.leading) {
                                Text(productData.brandName ?? "-")
                                    .bold()
                                Text(productData.name ?? "-")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Divider()
                }
            }
        }.onAppear {
            fetchProductData()
        }
    }
}
