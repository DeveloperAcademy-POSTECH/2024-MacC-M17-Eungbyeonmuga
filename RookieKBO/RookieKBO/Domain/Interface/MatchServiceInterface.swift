//
//  MatchServiceInterface.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

protocol MatchServiceInterface {
    func fetchMatch()
    func calculateScore(for match: Match, team: HomeAndAway) -> Int
    func getResult(for teamScore: Int, otherScore: Int) -> String
    func calculateInningText(for match: Match) -> String
    func adjustScores(_ scores: [Int]) -> [String] 
}
