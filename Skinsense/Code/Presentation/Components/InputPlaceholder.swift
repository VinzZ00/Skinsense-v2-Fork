//
//  InputPlaceholder.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 11/11/23.
//

import SwiftUI

struct InputPlaceholder: View {
    @State var review = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("Write Your Review")
                .multilineTextAlignment(.leading)
                .font(.headline)
                .bold()
            VStack{
                TextField("Input your review here", text: $review)
                    .font(.body)
                    .foregroundColor(Color.customDarkGrey)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.lightPurple))
            }
        }
    }
}

#Preview {
    InputPlaceholder()
}
