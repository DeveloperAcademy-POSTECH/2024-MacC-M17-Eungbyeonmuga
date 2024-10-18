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
    let gameInfos: [GameInfo]
    
    struct GameInfo: Decodable {
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
        private func toTeams(name: String) -> Team {
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
        func toMatch() -> Result<Match, NetworkError> {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            guard let date = dateFormatter.date(from: startDateTime) else {
                return .failure(.matchinvalidDateError)
            }
            
            let homeTeam = toTeams(name: homeTeam)
            let awayTeam = toTeams(name: awayTeam)
            
            let gameState: GameState
            switch gameStatus {
            case "경기 준비":
                gameState = .PREPARE
            case "경기 중":
                gameState = .PLAYING
            case "경기 종료":
                gameState = .END
            case "경기 취소":
                gameState = .CANCEL
            default:
                gameState = .END
            }
            
            let scoreBoard = [
                ScoreBoard(homeAndAway: .HOME, runs: homeRHEB[0], hits: homeRHEB[1], errors: homeRHEB[2], balls: homeRHEB[3], scores: homeScores),
                ScoreBoard(homeAndAway: .AWAY, runs: awayRHEB[0], hits: awayRHEB[1], errors: awayRHEB[2], balls: awayRHEB[3], scores: awayScores)
            ]
            
            let match = Match(
                startDateTime: date,
                gameState: gameState,
                homeTeam: homeTeam,
                awayTeam: awayTeam,
                place: place,
                season: season,
                scoreBoard: scoreBoard
            )
            return .success(match)
        }
    }
    
    /// 모든 게임 정보를 Match로 변환합니다.
    func toMatches() -> Result<[Match], NetworkError> {
        var matches: [Match] = []
        
        for gameInfo in gameInfos {
            switch gameInfo.toMatch() {
            case .success(let match):
                if let scoreBoard = match.scoreBoard,
                   !(match.gameState == .END && scoreBoard[0].scores.isEmpty) {
                    matches.append(match)
                }
            case .failure(let error):
                return .failure(error)
            }
        }
        return .success(matches)
    }
}
