//
//  TeamRank.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import Foundation

struct TeamRank: Codable {
    let rank: String
    let team: String
    let wins: String
    let draws: String
    let losses: String
    let win_rate: String
}
