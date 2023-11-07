//
//  CustomCheckbox.swift
//  Skinsense
//
//  Created by Rainer Regan on 07/11/23.
//

import SwiftUI

struct CustomCheckbox: View {
    @State var isActive: Bool = false
    
    var name: String
    
    var body: some View {
        Button {
            // Ketika di klik
            isActive.toggle()
        } label: {
            Text(name)
                .bold()
                .foregroundStyle(
                    isActive ? Color.mediumPurple : Color.customGrey
                )
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
        }
        .buttonStyle(.plain)
        .background(isActive ? Color.lightPurple : Color.white)
        .cornerRadius(10) /// make the background rounded
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    isActive ? Color.mediumPurple : Color.customGrey,
                    lineWidth: 2
                )
        )
    }
}

#Preview {
    CustomCheckbox(name: "Preview")
}
