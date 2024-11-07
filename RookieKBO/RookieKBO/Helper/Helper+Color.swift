//
//  Helper+Color.swift
//  RookieKBO
//
//  Created by Simmons on 10/9/24.
//

import SwiftUI

extension Color {
    
    static func teamColor(for name: String) -> Color? {
        switch name {
        case "ssg":
            return .ssg
        case "kia":
            return .kia
        case "kt":
            return .kt
        case "lg":
            return .lg
        case "nc":
            return .nc
        case "doosan":
            return .doosan
        case "lotte":
            return .lotte
        case "samsung":
            return .samsung
        case "kiwoom":
            return .kiwoom
        case "hanwha":
            return .hanwha
        case "primary":
            return .brandPrimary
        default:
            return .brandPrimary
        }
    }
}
