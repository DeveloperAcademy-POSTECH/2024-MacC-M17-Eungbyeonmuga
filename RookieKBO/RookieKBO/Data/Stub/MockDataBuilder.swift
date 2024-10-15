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
            gameState: GameState.PLAYING,
            homeTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg"),
            awayTeam: Team(name: "두산 베어스", image: "doosanUnder", color: "doosan"),
            place: "인천 ssg랜더스필드",
            scoreBoard: [
                ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 1, 0 ]),
                ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 1, 1])
            ]
        )
    }
}
