//
//  Helper+Color.swift
//  RookieKBO
//
//  Created by Simmons on 10/9/24.
//

import SwiftUI

extension Color {
    
    static func teamColor(for name: String) -> Color? {
        switch name.lowercased() {
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
        case "doosan", "두산":
            return .doosan
        case "lotte", "롯데":
            return .lotte
        case "samsung", "삼성":
            return .samsung
        case "kiwoom", "키움":
            return .kiwoom
        case "hanwha", "한화":
            return .hanwha
        case "allTeam":
            return .brandPrimary
        default:
            return .brandPrimary
        }
    }
    
    static func teamGdColor(for name: String) -> Color? {
        switch name {
        case "ssg":
            return .ssgGd
        case "kia":
            return .kiaGd
        case "kt":
            return .ktGd
        case "lg":
            return .lgGd
        case "nc":
            return .ncGd
        case "doosan":
            return .doosanGd
        case "lotte":
            return .lotteGd
        case "samsung":
            return .samsungGd
        case "kiwoom":
            return .kiwoomGd
        case "hanwha":
            return .hanwhaGd
        case "allTeam":
            return .brandPrimaryGd
        default:
            return .brandPrimaryGd
        }
    }
}

