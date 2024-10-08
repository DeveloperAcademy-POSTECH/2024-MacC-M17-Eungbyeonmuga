//
//  MatchServiceImpl.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

final class MatchServiceImpl: MatchServiceInterface {
    
    func fetchMatch() {
        // 서버에서 경기 받아오기
    }
    
    func calculateScore(for match: Match, team: HomeAndAway) -> Int {
        guard let scoreBoard = match.scoreBoard?.first(where: { $0.homeAndAway == team }) else {
            return 0
        }
        return scoreBoard.scores.reduce(0, +)
    }
}
