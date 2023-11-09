//
//  CustomLabel.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 09/11/23.
//

import SwiftUI

struct CustomLabel: View {
    var text: String
    var body: some View {
        VStack{
            Text(text)
                .font(.body)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(Color.lightPurple)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CustomLabel(text: "anjay")
}
