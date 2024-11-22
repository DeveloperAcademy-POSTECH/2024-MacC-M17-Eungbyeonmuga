//
//  WidgetMatchManager.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 10/13/24.
//

import Foundation
import SwiftUI


// 점수 기준으로 승, 패 및 색 반환
func getResult(for teamScore: Int, otherScore: Int) -> WidgetMatchResult {
    if teamScore > otherScore {
        return .win
    } else if teamScore < otherScore {
        return .lose
    } else {
        return .draw
    }
}

enum WidgetMatchResult {
    case win
    case lose
    case draw
    
    var color: Color {
        switch self {
        case .win:
            return .widget100
        case .lose:
            return .widget30
        case .draw:
            return .widget50
        }
    }
    
    var description: String {
        switch self {
        case .win:
            return "승"
        case .lose:
            return "패"
        case .draw:
            return "무"
        }
    }
}

// 선택한 팀 반환 함수
func getSelectTeam() -> SelectTeamType {
    let stubSelectTeamService = SelectTeamServiceImpl()
    guard let selectTeam = stubSelectTeamService.getUserDefaultsTeamObject()
    else {
        return .allType
    }
    
    switch selectTeam.name {
    case "SSG 랜더스":
        return .ssgType
    case "LG 트윈스":
        return .lgType
    case "롯데 자이언츠":
        return .lotteType
    case "삼성 라이온즈":
        return .samsungType
    case "두산 베어스":
        return .doosanType
    case "KIA 타이거즈":
        return .kiaType
    case "키움 히어로즈":
        return .kiwoomType
    case "한화 이글스":
        return .hanwhaType
    case "KT 위즈":
        return .ktType
    case "NC 다이노스":
        return .ncType
    default:
        return .allType
    }
}

// 각 팀의 색 반환을 위한 함수
func colorString(for teamType: SelectTeamType) -> String {
    switch teamType {
    case .allType:
        return "allTeam"
    case .ssgType:
        return "ssg"
    case .lgType:
        return "lg"
    case .lotteType:
        return "lotte"
    case .samsungType:
        return "samsung"
    case .doosanType:
        return "doosan"
    case .kiaType:
        return "kia"
    case .kiwoomType:
        return "kiwoom"
    case .hanwhaType:
        return "hanwha"
    case .ktType:
        return "kt"
    case .ncType:
        return "nc"
    }
}

// 각 팀의 캐릭터 이미지 반환을 위한 함수
func teamTypeCharacterString(for teamType: SelectTeamType) -> String {
    switch teamType {
    case .allType:
        return "widget_all"
    case .ssgType:
        return "widget_ssg"
    case .lgType:
        return "widget_lg"
    case .lotteType:
        return "widget_lotte"
    case .samsungType:
        return "widget_samsung"
    case .doosanType:
        return "widget_doosan"
    case .kiaType:
        return "widget_kia"
    case .kiwoomType:
        return "widget_kiwoom"
    case .hanwhaType:
        return "widget_hanwha"
    case .ktType:
        return "widget_kt"
    case .ncType:
        return "widget_nc"
    }
}

// 각 팀의 캐릭터 이미지 반환을 위한 함수
func teamCharacterString(for team: Team) -> String {
    switch team.name {
    case "전체 구단":
        return "widget_all"
    case "SSG 랜더스":
        return "widget_ssg"
    case "LG 트윈스":
        return "widget_lg"
    case "롯데 자이언츠":
        return "widget_lotte"
    case "삼성 라이온즈":
        return "widget_samsung"
    case "두산 베어스":
        return "widget_doosan"
    case "KIA 타이거즈":
        return "widget_kia"
    case "키움 히어로즈":
        return "widget_kiwoom"
    case "한화 이글스":
        return "widget_hanwha"
    case "KT 위즈":
        return "widget_kt"
    case "NC 다이노스":
        return "widget_nc"
    default:
        return "widget_all"
    }
}
