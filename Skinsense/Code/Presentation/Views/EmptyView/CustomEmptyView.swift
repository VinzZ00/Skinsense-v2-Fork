//
//  CustomEmptyView.swift
//  Skinsense
//
//  Created by Rainer Regan on 14/11/23.
//

import SwiftUI

struct CustomEmptyView: View {
    var title: String
    var subTitle: String
    var image: String = "not_found"
    var withImage: Bool = true
    
    var body: some View {
        VStack(spacing: 15) {
            if withImage {
                Image(image)
            }
            Text(title)
                .font(.title3)
                .bold()
            Text(subTitle)
                .frame(maxWidth: 200)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    CustomEmptyView(
    title: "Title", subTitle: "S")
}
