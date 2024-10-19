//
//  Helper+Color.swift
//  RookieKBO
//
//  Created by Simmons on 10/9/24.
//

import SwiftUI

typealias Background = Color.Background
typealias Brand = Color.Brand
typealias ScoreBoardColor = Color.ScoreBoardColor
typealias TeamColor = Color.TeamColor
typealias TeamSelect = Color.TeamSelect
typealias TextLabel = Color.TextLabel

extension Color {
    
    static func teamColor(for name: String) -> Color? {
        switch name {
        case "ssg":
            return Color.TeamColor.ssg
        case "kia":
            return Color.TeamColor.kia
        case "kt":
            return Color.TeamColor.kt
        case "lg":
            return Color.TeamColor.lg
        case "nc":
            return Color.TeamColor.nc
        case "doosan":
            return Color.TeamColor.doosan
        case "lotte":
            return Color.TeamColor.lotte
        case "samsung":
            return Color.TeamColor.samsung
        case "kiwoom":
            return Color.TeamColor.kiwoom
        case "hanwha":
            return Color.TeamColor.hanwha
        case "primary":
            return .Brand.primary
        default:
            return .Brand.primary
        }
    }
    
    enum Background {
        static let first = Color(.first)
        static let second = Color(.second)
    }
    
    enum ScoreBoardColor {
        static let homeBg = Color(.homeBg)
        static let scoreBoardBg = Color(.scoreBoardBg)
    }
    
    enum Brand {
        static let primary = Color(.primary)
        static let primaryGd = Color(.primaryGd)
    }
    
    enum TeamColor {
        static let doosan = Color(.doosan)
        static let doosanGd = Color(.doosanGd)
        static let hanwha = Color(.hanwha)
        static let hanwhaGd = Color(.hanwhaGd)
        static let kia = Color(.kia)
        static let kiaGd = Color(.kiaGd)
        static let kiwoom = Color(.kiwoom)
        static let kiwoomGd = Color(.kiwoomGd)
        static let kt = Color(.kt)
        static let ktGd = Color(.ktGd)
        static let lg = Color(.lg)
        static let lgGd = Color(.lgGd)
        static let lotte = Color(.lotte)
        static let lotteGd = Color(.lotteGd)
        static let nc = Color(.nc)
        static let ncGd = Color(.ncGd)
        static let samsung = Color(.samsung)
        static let samsungGd = Color(.samsungGd)
        static let ssg = Color(.ssg)
        static let ssgGd = Color(.ssgGd)
    }
    
    enum TeamSelect {
        static let stroke = Color(.stroke)
        static let unselectBg = Color(.unselectBg)
    }
    
    enum TextLabel {
        static let main = Color(.main)
        static let scoreBoard = Color(.scoreBoard)
        static let tab = Color(.tab)
        static let widget30 = Color(.widget30)
        static let widget50 = Color(.widget50)
        static let widget100 = Color(.widget100)
    }
    
    enum WidgetBackground {
        static let widgetHomeBg = Color(.widgetHomeBg)
        static let widgetScoreBoardBg = Color(.widgetScoreBoardBg)
    }
}
