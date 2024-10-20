//
//  MatchServiceImpl.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

final class MatchServiceImpl: MatchServiceInterface {
    
    func fetchGames() {
        // 경기 받아오기
    }
    
    func calculateScore(for match: Match, team: HomeAndAway) -> Int {
        guard let scoreBoard = match.scoreBoard?.first(where: { $0.homeAndAway == team }) else {
            return 0
        }
        return scoreBoard.scores.reduce(0, +)
    }
    
    func getAllTeamResult(for teamScore: Int, otherScore: Int) -> AllMatchResult {
        if teamScore > otherScore {
            return .win
        } else if teamScore < otherScore {
            return .lose
        } else {
            return .draw
        }
    }
    
    func getMyTeamResult(for teamScore: Int, otherScore: Int) -> MyTeamMatchResult {
        if teamScore > otherScore {
            return .win
        } else if teamScore < otherScore {
            return .lose
        } else {
            return .draw
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
    
    func adjustScores(_ scores: [Int], inning: ScoreBoardView.Inning) -> [String] {
        var adjustedScores = scores.map { "\($0)" }
        
        if adjustedScores.count < inning.rawValue {
            let missingCount = inning.rawValue - adjustedScores.count
            adjustedScores += Array(repeating: "-", count: missingCount)
        }
        
        return adjustedScores
    }
    
    func isDateInPast(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        return date < today
    }
    
    func isDateToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        return date >= today && date < tomorrow
    }
    
    func isDateInFuture(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        return date >= tomorrow
    }
    
    func isMyTeam(_ team: Team, _ myTeam: Team) -> Bool {
        return team.name.lowercased().contains(myTeam.name.lowercased())
    }
}
