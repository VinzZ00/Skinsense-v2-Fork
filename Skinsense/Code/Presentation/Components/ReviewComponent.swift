//
//  ReviewComponent.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 09/11/23.
//

import SwiftUI

struct ReviewComponent: View {
    var review: Review
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack(spacing: 12){
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading){
                    Text(review.user.name ?? "")
                        .font(.subheadline)
                        .bold()
                    
                    Text((review.user.skinTypes ?? "") + ", " + (review.user.skinConcerns ?? "")).font(.subheadline)
                    Spacer()
                        .frame(height: 10)
                    RatingsView(value: review.rating)
                }
                
                Spacer()
                
                Button {
                    // TODO: Implement like
                } label: {
                    VStack {
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
//                        Text("\(review.likes)")
//                            .font(.caption)
                    }
                }
                
            }
            
            Text(review.comment)
                .font(.subheadline)
        }
    }
}

#Preview {
    ReviewComponent(review: Review(id: UUID().uuidString, rating: 4.3, comment: "This is review", user: APIUser(id: UUID().uuidString, name: "User Name", skinTypes: "Dry", skinConcerns: "Redness, Acne")))
}
