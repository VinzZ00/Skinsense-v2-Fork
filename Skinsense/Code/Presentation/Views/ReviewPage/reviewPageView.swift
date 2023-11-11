//
//  reviewPageView.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 11/11/23.
//

import SwiftUI

struct reviewPageView: View {
    @StateObject var viewModel: ReviewViewModel = ReviewViewModel()
    
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    ReviewComponent(review: Review(
                        id: UUID().uuidString,
                        user: User(id: UUID().uuidString,
                                   name: "Shelamines",
                                   email: "shelamines@shela.mines",
                                   photo: "Inez",
                                   skinTypes: [
                                    SkinType(name: "Dry, Sensitive")
                                   ],
                                   skinConcerns: [
                                    SkinConcern(name: "Redness")
                                   ],
                                   allergens: []
                                  ),
                        rating: 5,
                        notes: "I love The Originote Acne Spot Cream! It works wonders on my acne, and my skin looks clearer ❤️",
                        likes: 32))
                    ReviewComponent(review: Review(
                        id: UUID().uuidString,
                        user: User(id: UUID().uuidString,
                                   name: "Shelamines",
                                   email: "shelamines@shela.mines",
                                   photo: "Kate",
                                   skinTypes: [
                                    SkinType(name: "Dry, Sensitive")
                                   ],
                                   skinConcerns: [
                                    SkinConcern(name: "Redness")
                                   ],
                                   allergens: []
                                  ),
                        rating: 5,
                        notes: "It really works for me. I will recommend this to my friends wo have oily skin and dry concerned. I combined this products with Cosrx Morning Cleanser and it really made an impact on my skin",
                        likes: 32))
                    ReviewComponent(review: Review(
                        id: UUID().uuidString,
                        user: User(id: UUID().uuidString,
                                   name: "Shelamines",
                                   email: "shelamines@shela.mines",
                                   photo: "April",
                                   skinTypes: [
                                    SkinType(name: "Dry, Sensitive")
                                   ],
                                   skinConcerns: [
                                    SkinConcern(name: "Redness")
                                   ],
                                   allergens: []
                                  ),
                        rating: 5,
                        notes: "I currently using this product in my daily skincare routine. But i feel that this product doesn’t give me a significant effects on my skin concern.",
                        likes: 32))
                    ReviewComponent(review: Review(
                        id: UUID().uuidString,
                        user: User(id: UUID().uuidString,
                                   name: "Shelamines",
                                   email: "shelamines@shela.mines",
                                   photo: "Agnes",
                                   skinTypes: [
                                    SkinType(name: "Dry, Sensitive")
                                   ],
                                   skinConcerns: [
                                    SkinConcern(name: "Redness")
                                   ],
                                   allergens: []
                                  ),
                        rating: 5,
                        notes: "For my skin this product doesn’t gave me a significant effects. But, right now i’m trying to combine this product with the compatible ingredients so we will see later",
                        likes: 32))
                    ReviewComponent(review: Review(
                        id: UUID().uuidString,
                        user: User(id: UUID().uuidString,
                                   name: "Shelamines",
                                   email: "shelamines@shela.mines",
                                   photo: "Daniella",
                                   skinTypes: [
                                    SkinType(name: "Dry, Sensitive")
                                   ],
                                   skinConcerns: [
                                    SkinConcern(name: "Redness")
                                   ],
                                   allergens: []
                                  ),
                        rating: 5,
                        notes: "I love The Originote Acne Spot Cream! It works wonders on my acne, and my skin looks clearer ❤️",
                        likes: 32))
                }
            }
            Divider()
                .frame(height: 20)
            
            CustomButton(title: "Add Review", action:{
                viewModel.isSheetOpened = true
            })
            .foregroundColor(Color.lightPurple)
        }
        .padding()
        .sheet(isPresented: $viewModel.isSheetOpened, content: {
            addReviewSheetView(isSheetOpened: $viewModel.isSheetOpened)
                .padding(.top, 32)
        })
    }
}

struct addReviewSheetView: View {
    @Binding var isSheetOpened : Bool
    
    var body: some View {
        VStack{
            ProductImageWithStamp(imageLink: "skincare_product1")
            Text("The Originote")
                .font(.subheadline)
                .foregroundColor(Color.customDarkGrey)
            
            Text("Acne Spot Cream")
                .font(.title3)
                .bold()
            Spacer()
                .frame(height: 10)
            HStack{
                Image(systemName: "heart")
                Image(systemName: "heart")
                Image(systemName: "heart")
                Image(systemName: "heart")
                Image(systemName: "heart")
            }
            Spacer()
                .frame(height: 30)
            InputPlaceholder(review: "Input your review here")
        }
        .padding()
    }
}


#Preview {
    reviewPageView()
}
