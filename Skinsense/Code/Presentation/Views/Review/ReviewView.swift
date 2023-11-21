//
//  ReviewView.swift
//  Skinsense
//
//  Created by Rainer Regan on 20/11/23.
//

import SwiftUI
import Kingfisher

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
                    viewModel.showAddReviewSheet.toggle()
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Reviews")
        .sheet(isPresented: $viewModel.showAddReviewSheet, content: {
            if let product = viewModel.product {
                AddReviewSheetView(viewModel: viewModel, product: product)
            } else {
                ProgressView()
            }
        })
    }
}

struct AddReviewSheetView : View {
    @ObservedObject var viewModel: ReviewViewViewModel
    
    var product: Product
    var repository : ReviewRepository = ReviewRepository()
    
    @State var selectedRating : Double = 0
    @State var review: String = ""
    
    func addReview() {
        if let userData = viewModel.userData {
            let review =  Review(id: UUID().uuidString, rating: selectedRating, comment: review, totalLikes: 0, user: userData, product: viewModel.product)
            
            repository.create(reviewData: review) { result in
                switch result {
                case .success(let review):
                    viewModel.showAddReviewSheet = false
                    viewModel.reviews.append(review)
                    print(review)
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            print("User data is null")
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 32) {
                        if let photo = product.photo {
                            KFImage(URL(string: photo))
                                .resizable()
                                .frame(width: 200, height: 200)
                                .scaledToFit()
                        } else {
                            Image("placeholder")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .scaledToFit()
                        }
                        
                        if let brandName = product.brandName, let name = product.name {
                            VStack {
                                Text(brandName)
                                    .font(.subheadline)
                                Text(name)
                                    .font(.title3)
                                    .bold()
                            }
                        }
                        
                        HStack(spacing: 16) {
                            ForEach(1..<6) { i in
                                Button {
                                    self.selectedRating = Double(i)
                                } label : {
                                    Image(systemName: Int(self.selectedRating) >= i ? "heart.fill" : "heart")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                }
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Write your review")
                                .font(.headline)
                                .bold()
                            
                            TextField("Write your review here", text: $review)
                                .padding()
                        }
                    }
                    .padding()
                }
                VStack {
                    CustomButton(title: "Add Review") {
                        addReview()
                    }
                }
                .padding()
            }
            .navigationTitle("Add Review")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        viewModel.showAddReviewSheet = false
                    } label : {
                        Text("Back")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ReviewView(viewModel: ReviewViewViewModel(productId: "10004"))
    }
}
