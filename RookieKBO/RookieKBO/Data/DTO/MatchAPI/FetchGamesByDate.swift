//
//  FetchGamesByDate.swift
//  RookieKBO
//
//  Created by Simmons on 10/16/24.
//

import Foundation

struct FetchGamesByDateRequest: Encodable {
    let date: String
}

struct FetchGamesByDateResponse: Decodable {
    
    let gameInfos: [GameInfo]
    
    struct GameInfo: Decodable {
        let season: String
        let startDate: String
        let place: String
        let gameStatus: GameState // 스트링으로 받아옴
        let homeTeam: String
        let awayTeam: String
        let homeScores: [Int]
        let awayScores: [Int]
        let homeRHEB: [Int]
        let awayRHEB: [Int]
        let homeScore: Int
        let awayScore: Int
    }
    
    // 변환
    func toScoreBoard() -> [Match] {
        self.gameInfos.compactMap {
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            let startDateTime = dateFormatter.date(from: $0.startDate) ?? Date()
            
            let gameState = GameState(rawValue: $0.gameStatus.rawValue) ?? .CANCEL
            
            let homeScoreBoard = ScoreBoard(
                homeAndAway: .HOME,
                runs: $0.homeRHEB[0],
                hits: $0.homeRHEB[1],
                errors: $0.homeRHEB[2],
                balls: $0.homeRHEB[3],
                scores: $0.homeScores
            )
            
            let awayScoreBoard = ScoreBoard(
                homeAndAway: .AWAY,
                runs: $0.awayRHEB[0],
                hits: $0.awayRHEB[1],
                errors: $0.awayRHEB[2],
                balls: $0.awayRHEB[3],
                scores: $0.awayScores
            )
            
            return Match(
                startDateTime: startDateTime,
                gameState: gameState,
                homeTeam: Team(name: $0.homeTeam, image: "", color: ""),
                awayTeam: Team(name: $0.awayTeam, image: "", color: ""),
                place: $0.place,
                scoreBoard: [homeScoreBoard, awayScoreBoard]
            )
        }
    }
}

// 받아오는 데이터입니다람쥐똥
// "gameInfos": [{"season": "정규시즌", "startDateTime": "2024-09-01T14:00:00", "place": "잠실 야구장", "gameStatus": "경기 종료", "homeTeam": "두산", "awayTeam": "롯데", "homeScores": [0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0], "awayScores": [2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], "homeRHEB": [3, 6, 0, 5], "awayRHEB": [4, 12, 1, 6], "homeScore": 3, "awayScore": 4}]
