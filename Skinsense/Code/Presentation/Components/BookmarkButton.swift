//
//  BookmarkButton.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import SwiftUI

struct BookmarkButton: View {
    var onClick: (Bool) -> Void
    
    @State var isActive = false
    
    var body: some View {
        Button {
            isActive.toggle()
            onClick(isActive)
        } label: {
            Image (systemName: isActive ? "bookmark.fill" : "bookmark")
                .resizable()
                .foregroundColor(.darkPurple)
                .scaledToFit()
                .frame(width: 28, height: 28)
        }
    }
}

#Preview {
    BookmarkButton { state in
        print(state)
    }
}
