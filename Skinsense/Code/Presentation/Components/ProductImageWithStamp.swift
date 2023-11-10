//
//  ProductImageWithStamp.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import SwiftUI

struct ProductImageWithStamp: View {
    var isRecommended: Bool = true
    var imageLink: String
    var imageSize: ProductImageSize = .normal

    enum ProductImageSize {
        case normal
        case small
    }
    
    struct ImageSize {
        var width: CGFloat
        var height: CGFloat
    }
    
    private func getProductImageSize() -> ImageSize {
        switch self.imageSize {
        case .normal:
            return ImageSize(width: 260, height: 260)
        case .small:
            return ImageSize(width: 140, height: 140)
        }
    }
    
    private func getStampImageSize() -> ImageSize {
        switch self.imageSize {
        case .normal:
            return ImageSize(width: 90, height: 90)
        case .small:
            return ImageSize(width: 60, height: 60)
        }
    }
    
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            Image(imageLink)
                .resizable()
                .scaledToFit()
                .frame(width: getProductImageSize().width, height: getProductImageSize().height)
            Image(isRecommended ? "Stamp_Recommended" : "Stamp_Not_Recommended")
                .resizable()
                .scaledToFit()
                .frame(width: getStampImageSize().width, height: getStampImageSize().height)
                .padding(.trailing, imageSize == .normal ? 40 : 10)
        }
    }
}

#Preview {
    ProductImageWithStamp(
        imageLink: "skincare_product1",
        imageSize: .small
    )
}
