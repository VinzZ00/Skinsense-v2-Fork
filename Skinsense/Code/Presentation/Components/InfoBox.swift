//
//  InfoBox.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import SwiftUI

struct InfoBox: View {
    @Environment(\.colorScheme) var colorScheme
    
    var text : String
    var type : InfoBoxType = .info
    var showIcon: Bool = true
    
    enum InfoBoxType {
        case info
        case danger
        case success
    }
    
    private func getIcon() -> String {
        switch self.type {
        case .info:
            return "info.circle.fill"
        case .danger:
            return "exclamationmark.triangle.fill" // TODO: Change this into danger icon
        case .success:
            return "info.circle.fill"
        }
    }
    
    private func getBgColor() -> Color {
        switch self.type {
        case .info:
            return colorScheme == .light ? Color.lightBlue.opacity(0.1) : Color.lightBlue.opacity(0.3)
        case .danger:
            return colorScheme == .light ? Color.red.opacity(0.1) : Color.red.opacity(0.3)
        case .success:
            return colorScheme == .light ? Color.customGreen.opacity(0.1) : Color.customGreen.opacity(0.3)
        }
    }
    
    private func getStrokeColor() -> Color {
        switch self.type {
        case .info:
            return Color.blue
        case .danger:
            return Color.red
        case .success:
            return Color.customGreen
        }
    }
    
    private func getIconColor() -> Color {
        switch self.type {
        case .info:
            return Color.blue
        case .danger:
            return Color.red
        case .success:
            return Color.customGreen
        }
    }
    
    var body: some View {
        HStack(spacing: 16){
            if(self.showIcon) {
                Image(systemName: getIcon())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(getIconColor())
            }
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                .foregroundColor(colorScheme == .light ? .black : .white)
                .buttonStyle(.plain)
        }
        .padding()
        .background(getBgColor())
        .cornerRadius(10)
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 10)
                .stroke(getStrokeColor(), lineWidth: 1)
        )
    }
}

#Preview {
    InfoBox(text: "This is info", type: .success, showIcon: true)
}
