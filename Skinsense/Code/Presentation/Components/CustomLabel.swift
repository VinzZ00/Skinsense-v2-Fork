//
//  CustomLabel.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 09/11/23.
//

import SwiftUI

struct CustomLabel: View {
    @Environment(\.colorScheme) var colorScheme
    
    var text: String
    
    var body: some View {
        VStack{
            Text(text)
                .font(.caption)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(colorScheme == .light ? Color.lightPurple : Color.darkPurple)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CustomLabel(text: "anjay")
}
