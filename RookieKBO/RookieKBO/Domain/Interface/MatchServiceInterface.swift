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
}
