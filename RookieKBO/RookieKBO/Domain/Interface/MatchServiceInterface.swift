//
//  MatchServiceInterface.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

protocol MatchServiceInterface {
    func fetchMatches(date: String) async -> Result<[Match], Error>
    func calculateScore(for match: Match, team: HomeAndAway) -> Int
    func getAllTeamResult(for teamScore: Int, otherScore: Int) -> AllMatchResult
    func getMyTeamResult(for teamScore: Int, otherScore: Int) -> MyTeamMatchResult
    func calculateInningText(for match: Match) -> String
    func adjustScores(_ scores: [Int], inning: ScoreBoardView.Inning) -> [String]
}
