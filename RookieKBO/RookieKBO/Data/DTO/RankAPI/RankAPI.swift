//
//  RankAPI.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import Foundation


struct FetchRanksResponse: Decodable {
    let teamInfoList: [TeamInfoList]
    
    struct TeamInfoList: Decodable {
        let rank: String
        let name: String
        let numberOfWins: String
        let numberOfDraws: String
        let numberOfLosses: String
        let winningRate: String
    }
    
    func toRanks() -> Result<[TeamRank], NetworkError> {
        let teamRanks = teamInfoList.map { rank in
            TeamRank(
                id: UUID(),
                rank: rank.rank,
                team: rank.name,
                wins: rank.numberOfWins,
                draws: rank.numberOfDraws,
                losses: rank.numberOfLosses,
                winRate: rank.winningRate
            )
        }
        return .success(teamRanks)
    }
}
