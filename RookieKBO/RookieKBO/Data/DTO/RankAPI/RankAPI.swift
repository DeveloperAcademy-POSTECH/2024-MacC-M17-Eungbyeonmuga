//
//  RankAPI.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import Foundation


struct FetchRanksResponse: Decodable {
    let ranks: [Ranks]
    
    struct Ranks: Decodable {
        let rank: String
        let team: String
        let games: String
        let wins: String
        let draws: String
        let losses: String
        let win_rate: String
        let points_for: String
        let points_against: String
    }
    
    func toRanks() -> Result<[TeamRank], NetworkError> {
        let teamRanks = ranks.map { rank in
            TeamRank(
                id: UUID(),
                rank: rank.rank,
                team: rank.team,
                wins: rank.wins,
                draws: rank.draws,
                losses: rank.losses,
                winRate: rank.win_rate
            )
        }
        return .success(teamRanks)
    }
}
