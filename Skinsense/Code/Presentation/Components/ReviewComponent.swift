//
//  ReviewComponent.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 09/11/23.
//

import SwiftUI

struct ReviewComponent: View {
    @State var review: Review
    
    func addLike() {
        ReviewRepository.shared.addLike(reviewId: self.review.id) { result in
            switch result {
            case .success(let success):
                self.review = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack(spacing: 12){
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading, spacing: 8){
                    Text(review.user.name ?? "User")
                        .font(.subheadline)
                        .bold()
                    
                    VStack(alignment: .leading) {
                        Text("Skin Type: \(review.user.skinTypes ?? "-")")
                            .font(.caption2)
                        Text("Skin Concerns: \(review.user.skinConcerns ?? "-")")
                            .font(.caption2)
                    }
                    RatingsView(value: review.rating)
                }
                
                Spacer()
                
                Button {
                    // TODO: Implement like
                    addLike()
                } label: {
                    VStack {
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("\(review.totalLikes)")
                            .font(.caption)
                    }
                }
                
            }
            
            Text(review.comment)
                .font(.subheadline)
            Divider()
        }
    }
}

#Preview {
    ReviewComponent(review: Review(id: UUID().uuidString, rating: 4.3, comment: "This is review", totalLikes: 10, user: APIUser(id: UUID().uuidString, name: "User Name", skinTypes: "Dry", skinConcerns: "Redness, Acne")))
}
