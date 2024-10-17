//
//  MatchServiceImpl.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

final class MatchServiceImpl: MatchServiceInterface {
    
    private let matchRepository = MatchRepository()
    
    ///Match 정보 패치합니다.
    func fetchMatches(date: String) async -> Result<[Match], Error> {
        let request = FetchMatchesRequest(date: date)
        let result = await matchRepository.fetchMatches(request: request)
        switch result {
        case .success(let fetchMatchesResponse):
            let matches = fetchMatchesResponse.toMatches()
            return .success(matches)
        case .failure(let error):
            return .failure(error)
        }
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
}
