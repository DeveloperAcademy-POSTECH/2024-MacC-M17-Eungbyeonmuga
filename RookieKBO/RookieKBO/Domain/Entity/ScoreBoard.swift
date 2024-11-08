//
//  ScoreBoard.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/7/24.
//

import Foundation

struct ScoreBoard: Codable, Identifiable, Equatable {
    var id: UUID
    var homeAndAway: HomeAndAway
    var runs: Int
    var hits: Int
    var errors: Int
    var balls: Int
    var scores: [Int]
    
    init(
        homeAndAway: HomeAndAway,
        runs: Int,
        hits: Int,
        errors: Int,
        balls: Int,
        scores: [Int]
    ) {
        self.id = UUID()
        self.homeAndAway = homeAndAway
        self.runs = runs
        self.hits = hits
        self.errors = errors
        self.balls = balls
        self.scores = scores
    }
}
