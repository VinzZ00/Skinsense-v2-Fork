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
    static var lightPurple: Color = Color(hex: 0xECE9FC)
    static var mediumPurple: Color = Color(hex: 0x8A6FD0)
    static var darkPurple: Color = Color(hex: 0x403D95)
    static var customGrey: Color = Color(hex: 0x959595)
    static var customDarkGrey: Color = Color(hex: 0x545454)
    static var customdarkBlue: Color = Color(hex: 0x1169BA)
    static var bgColor: Color = Color(hex: 0xF5F5F5)
    static var lightBlue: Color = Color(hex: 0x69B7FF)
    static var customGreen: Color = Color(hex: 0x3ABF3F)
    static var successText: Color = Color(hex: 0x4C9930)
    static var dangerText: Color = Color(hex: 0xE02828)
    static var lightGrey: Color = Color(hex: 0xE8E8E8)
    static var darkGrey: Color = Color(hex: 0x1C1C1E)
    
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
