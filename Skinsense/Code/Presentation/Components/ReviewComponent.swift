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
            HStack(spacing: 16){
                Image(review.user.photo ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading){
                    Text(review.user.name ?? "")
                        .font(.subheadline)
                        .bold()
                    if let skinTypes = review.user.skinTypes {
                        Text(skinTypes.map({$0.name}).joined(separator: ",")).font(.subheadline)
                    }
                    Spacer()
                        .frame(height: 10)
                    HStack{
                        Image(systemName: "heart")
                        Image(systemName: "heart")
                        Image(systemName: "heart")
                        Image(systemName: "heart")
                        Image(systemName: "heart")
                    }
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
                        Text("\(review.likes)")
                            .font(.caption)
                    }
                }
                
            }
            
            Text(review.notes)
                .font(.subheadline)
        }
    }
}

//#Preview {
//    @Environment(\.managedObjectContext) var moc
//    
//    let userData = User()
//    userData.email = "email"
//    userData.name = "Name"
//    userData.photo = "photo"
//    userData.skinConcerns = [SkinConcern(name: "Redness")]
//    userData.skinTypes = [SkinType(name: "Dry")]
//    userData.allergens = [Allergen(name: "Linalool")]
//    
//    ReviewComponent(review:
//                        Review(
//                            id: UUID().uuidString,
//                            user: userData,
//                            rating: 3.1,
//                            notes: "Cool",
//                            likes: 10)
//    )
//}
