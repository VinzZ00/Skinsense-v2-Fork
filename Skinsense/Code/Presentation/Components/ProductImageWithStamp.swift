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
    
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            Image(imageLink)
                .resizable()
                .scaledToFit()
                .frame(width: 252, height: 260)
            Image(isRecommended ? "Stamp_Recommended" : "Stamp_Not_Recommended")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .padding(.trailing, 40)
        }
    }
}

#Preview {
    ProductImageWithStamp(
        imageLink: "skincare_product1"
    )
}
