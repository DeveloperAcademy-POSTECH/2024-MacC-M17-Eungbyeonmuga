//
//  MockDataBuilder.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

struct MockDataBuilder {
   
    static var mockMatch: Match {
        return Match(
            startDateTime: Date(),
            gameState: GameState.END,
            homeTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg"),
            awayTeam: Team(name: "두산 베어스", image: "doosanUnder", color: "doosan"),
            place: "인천 ssg랜더스필드",
            scoreBoard: [
                ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 1, 0 ]),
                ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 1, 1])
            ]
        )
    }
    
    static var mockEmptyMatch: Match {
        return Match(
            startDateTime: Date(),
            gameState: GameState.END,
            homeTeam: Team(name: "", image: "", color: ""),
            awayTeam: Team(name: "", image: "", color: ""),
            place: "",
            scoreBoard: []
        )
    }
    
    static var mockMatchList: [Match] {
        return [
            Match(
                startDateTime: Calendar.current.date(byAdding: .hour, value: -1, to: Date())!,
                gameState: .PLAYING,
                homeTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg"),
                awayTeam: Team(name: "두산 베어스", image: "doosanUnder", color: "doosan"),
                place: "인천 ssg랜더스필드",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 1, 0]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 1, 1])
                ]
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
                gameState: .PREPARE,
                homeTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha"),
                awayTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg"),
                place: "대전 한화생명이글스파크",
                scoreBoard: []
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                gameState: .END,
                homeTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte"),
                awayTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom"),
                place: "부산 사직야구장",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 4, hits: 10, errors: 2, balls: 12, scores: [0, 2, 0, 1, 1]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 3, hits: 9, errors: 1, balls: 14, scores: [1, 0, 1, 0, 1])
                ]
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
                gameState: .CANCEL,
                homeTeam: Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung"),
                awayTeam: Team(name: "NC 다이노스", image: "ncUnder", color: "nc"),
                place: "대구 삼성라이온즈파크",
                scoreBoard: []
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
                gameState: .PREPARE,
                homeTeam: Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia"),
                awayTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg"),
                place: "광주 기아챔피언스필드",
                scoreBoard: []
            )
        ]
    }    
}
