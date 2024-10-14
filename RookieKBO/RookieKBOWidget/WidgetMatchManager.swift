//
//  WidgetMatchManager.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 10/13/24.
//

import Foundation

// 점수 계산
func calculateScore(for match: Match, team: HomeAndAway) -> Int {
    guard let scoreBoard = match.scoreBoard?.first(where: { $0.homeAndAway == team }) else {
        return 0
    }
    return scoreBoard.scores.reduce(0, +)
}

// 점수 기준으로 승, 패 반환
func getResult(for teamScore: Int, otherScore: Int) -> String {
    if teamScore > otherScore {
        return "승"
    } else if teamScore < otherScore {
        return "패"
    } else {
        return "무"
    }
}

// 이닝 계산
func calculateInningText(for match: Match) -> String {
    guard let homeScoreBoard = match.scoreBoard?.first(where: { $0.homeAndAway == .HOME }),
          let awayScoreBoard = match.scoreBoard?.first(where: { $0.homeAndAway == .AWAY }) else {
        return "이닝 정보 없음"
    }
    
    let homeInningCount = homeScoreBoard.scores.count
    let awayInningCount = awayScoreBoard.scores.count
    
    if homeInningCount == awayInningCount {
        return "\(homeInningCount)회 말"
    } else {
        return "\(awayInningCount)회 초"
    }
}

// 선택한 팀 반환 함수
func getSelectTeam() -> SelectTeamType {
    guard let teamName = UserDefaults.shared.string(forKey: "selectTeam") else {
        return .allType
    }
    switch teamName {
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
        return .hanhwaType
    case "KT 위즈":
        return .ktType
    case "NC 다이노스":
        return .ncType
    default:
        return .allType
    }
}
