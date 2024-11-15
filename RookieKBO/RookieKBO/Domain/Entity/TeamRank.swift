//
//  TeamRank.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import Foundation

struct TeamRank: Codable, Identifiable {
    let id: UUID
    let rank: String
    let team: String
    let wins: String
    let draws: String
    let losses: String
    let winRate: String
}
