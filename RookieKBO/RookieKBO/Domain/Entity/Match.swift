//
//  Match.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/7/24.
//

import Foundation

struct Match: Codable, Identifiable, Equatable {
    var id: UUID
    var startDateTime: Date
    var state: State
    var homeTeam: Team
    var awayTeam: Team
    var place: String
    var scoreBoard: [ScoreBoard]?
    
    init(startDateTime: Date, state: State, homeTeam: Team, awayTeam: Team, place: String, scoreBoard: [ScoreBoard]) {
        self.id = UUID()
        self.startDateTime = startDateTime
        self.state = state
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.place = place
        self.scoreBoard = scoreBoard
    }
}
