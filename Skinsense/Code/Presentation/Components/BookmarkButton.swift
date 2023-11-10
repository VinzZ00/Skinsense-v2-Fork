//
//  BookmarkButton.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import SwiftUI

struct BookmarkButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    var onClick: (Bool) -> Void
    
    @State var isActive = false
    
    var body: some View {
        Button {
            isActive.toggle()
            onClick(isActive)
        } label: {
            Image (systemName: isActive ? "bookmark.fill" : "bookmark")
                .resizable()
                .foregroundColor(colorScheme == .light ? .darkPurple : Color.mediumPurple)
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
