//
//  Color.swift
//  Skintrip
//
//  Created by Rainer Regan on 07/06/23.
//

import Foundation
import SwiftUI

extension Color {
    // Notes: Untuk nambah color, duplicate dibawah dan ganti hexnya
    static var mediumPurple: Color = Color(hex: 0x8A6FD0)
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
