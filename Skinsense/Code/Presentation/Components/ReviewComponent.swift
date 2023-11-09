//
//  ReviewComponent.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 09/11/23.
//

import SwiftUI

struct ReviewComponent: View {
    var name: String
    var skintype: String
    var review: String
    var totalLikes: Int
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading){
                    Text(name)
                        .font(.subheadline)
                        .bold()
                    Text(skintype)
                        .font(.subheadline)
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
                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            Spacer()
                .frame(height: 15)
            Text(review)
                .font(.subheadline)
            Text("\(totalLikes) Liked This Review")
                .font(.caption)
        }
    }
}

#Preview {
    ReviewComponent(name: "Shelamines", skintype: "dry to oily", review: "WAAHHHH Bagusss banget!!!!!!!", totalLikes: 40)
}
