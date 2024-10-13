//
//  WidgetMatchManager.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 10/13/24.
//

import Foundation

func calculateScore(for match: Match, team: HomeAndAway) -> Int {
    guard let scoreBoard = match.scoreBoard?.first(where: { $0.homeAndAway == team }) else {
        return 0
    }
    return scoreBoard.scores.reduce(0, +)
}

func getResult(for teamScore: Int, otherScore: Int) -> String {
    if teamScore > otherScore {
        return "승"
    } else if teamScore < otherScore {
        return "패"
    } else {
        return "무"
    }
}

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
