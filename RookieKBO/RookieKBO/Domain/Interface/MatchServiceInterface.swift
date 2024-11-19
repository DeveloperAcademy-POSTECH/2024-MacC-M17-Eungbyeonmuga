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
    func isDateInPast(_ date: Date) -> Bool
    func isDateToday(_ date: Date) -> Bool
    func isDateInFuture(_ date: Date) -> Bool
    func isMyTeam(_ team: Team, _ myTeam: Team) -> Bool
    func isValidDate(_ date: Date) -> Bool
    func filterMatches(for selectedDate: Date, in matchInfo: [Match]) -> [Match]
}
