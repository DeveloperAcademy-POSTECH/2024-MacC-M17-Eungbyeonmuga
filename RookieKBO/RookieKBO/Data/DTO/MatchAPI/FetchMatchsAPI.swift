//
//  FetchMatchsAPI.swift
//  RookieKBO
//
//  Created by crownjoe on 10/17/24.
//

import Foundation

struct FetchMatchesRequest: Encodable {
    let date: String
}

struct FetchMatchesResponse: Decodable {
    let season: String
    let startDateTime: String
    let place: String
    let gameStatus: String
    let homeTeam: String
    let awayTeam: String
    let homeScores: [Int]
    let awayScores: [Int]
    let homeRHEB: [Int]
    let awayRHEB: [Int]
    let homeScore: Int
    let awayScore: Int
    
    /// Team 조회 후 변환합니다.
    func toTeams(name: String) -> Team {
        let teams = [
            Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg"),
            Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia"),
            Team(name: "KT 위즈", image: "ktUnder", color: "kt"),
            Team(name: "LG 트윈스", image: "lgUnder", color: "lg"),
            Team(name: "NC 다이노스", image: "ncUnder", color: "nc"),
            Team(name: "두산 베어스", image: "doosanUnder", color: "doosan"),
            Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte"),
            Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung"),
            Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom"),
            Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha")
        ]
        
        let teamMapping: [String: String] = [
            "두산": "두산 베어스",
            "삼성": "삼성 라이온즈",
            "롯데": "롯데 자이언츠",
            "키움": "키움 히어로즈",
            "NC": "NC 다이노스",
            "LG": "LG 트윈스",
            "SSG": "SSG 랜더스",
            "한화": "한화 이글스",
            "KIA": "KIA 타이거즈",
            "KT": "KT 위즈"
        ]
        
        let teamName = teamMapping[name] ?? name
        return teams.first { $0.name == teamName } ?? Team(name: "", image: "", color: "")
    }
    
    /// Match로 변환합니다.
    func toMatches() -> Result<[Match], NetworkError> {
        let dateFormatter = ISO8601DateFormatter()
        
        guard let date = dateFormatter.date(from: startDateTime) else {
            return .failure(.matchinvalidDateError)
        }
        
        let homeTeam = toTeams(name: homeTeam)
        let awayTeam = toTeams(name: awayTeam)
        
        if homeScore == -1 || awayScore == -1 {
            return .failure(.matchinvalidScoreError)
        }
        
        let scoreBoard = [
            ScoreBoard(homeAndAway: .HOME, runs: homeRHEB[0], hits: homeRHEB[1], errors: homeRHEB[2], balls: homeRHEB[3], scores: homeScores),
            ScoreBoard(homeAndAway: .AWAY, runs: awayRHEB[0], hits: awayRHEB[1], errors: awayRHEB[2], balls: awayRHEB[3], scores: awayScores)
        ]
        
        let match = Match(
            startDateTime: date,
            gameState: GameState(rawValue: gameStatus) ?? .END,
            homeTeam: homeTeam,
            awayTeam: awayTeam,
            place: place,
            season: season,
            scoreBoard: scoreBoard
        )
        return .success([match])
    }
}
