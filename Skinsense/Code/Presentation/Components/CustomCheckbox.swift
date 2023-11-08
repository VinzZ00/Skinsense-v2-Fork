//
//  CustomCheckbox.swift
//  Skinsense
//
//  Created by Rainer Regan on 07/11/23.
//

import SwiftUI

struct CustomCheckbox: View {
    var onPress: (UUID) -> Void
    var id: UUID
    var name: String
    var isActive: Bool
    
    var body: some View {
        Button {
            // Ketika di klik
            self.onPress(self.id)
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

//#Preview {
//    CustomCheckbox(function: <#() -> Void#>, name: "Preview")
//}
