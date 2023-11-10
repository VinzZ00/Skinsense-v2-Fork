//
//  CustomCheckbox.swift
//  Skinsense
//
//  Created by Rainer Regan on 07/11/23.
//

import SwiftUI

struct CustomCheckbox: View {
    @Environment(\.colorScheme) var colorScheme
    
    var onPress: (GeneralAttribute) -> Void
    var object: GeneralAttribute
    var isActive: Bool
    
    var body: some View {
        Button {
            // Ketika di klik
            self.onPress(self.object)
        } label: {
            Text(object.name)
                .font(.body)
                .bold()
                .foregroundStyle(
                    isActive ?
                    (colorScheme == .light ? Color.mediumPurple : Color.white) :
                        Color.customGrey
                )
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
        }
        .buttonStyle(.plain)
        .background(
            isActive ?
            (colorScheme == .light ? Color.lightPurple : Color.darkPurple.opacity(0.8)) :
            (colorScheme == .light ? Color.white : Color.white.opacity(0.1))
        )
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
    CustomCheckbox(onPress: { _ in }, object: SkinType(name: "ok"), isActive: true)
}
