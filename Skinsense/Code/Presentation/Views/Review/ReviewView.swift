//
//  ReviewView.swift
//  Skinsense
//
//  Created by Rainer Regan on 20/11/23.
//

import SwiftUI

struct ReviewView: View {
    @StateObject var viewModel: ReviewViewViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.reviews, id: \.id) { review in
                        ReviewComponent(review: review)
                    }
                }
                .padding()
            }
            VStack {
                CustomButton(title: "Add Review") {
                    // Function
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Reviews")
    }
}

#Preview {
    NavigationView {
        ReviewView(viewModel: ReviewViewViewModel(productId: "10004"))
    }
}
