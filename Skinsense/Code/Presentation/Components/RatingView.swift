//
//  RatingView.swift
//  Skinsense
//
//  Created by Rainer Regan on 20/11/23.
//

import SwiftUI

/// A view displaying a star rating with a step of 0.5.
struct RatingsView: View {
    /// A value in range of 0.0 to 5.0.
    let value: Double
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { index in
                Image(systemName: imageName(for: index, value: value))
            }
        }
        .foregroundColor(.yellow)
    }
    
    func imageName(for starIndex: Int, value: Double) -> String {
        // Version A
        if value >= Double(starIndex + 1) {
            return "heart.fill"
        }
        else if value >= Double(starIndex) + 0.5 {
            return "heart.leadinghalf.filled"
        }
        else {
            return "heart"
        }
        
        // Version B
        switch value - Double(starIndex) {
        case ..<0.5: return "heart"
        case 0.5..<1.0: return "heart.leadinghalf.filled"
        default: return "heart.fill"
        }
    }
}
