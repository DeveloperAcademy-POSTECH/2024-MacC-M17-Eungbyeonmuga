//
//  FetchGamesByDate.swift
//  RookieKBO
//
//  Created by Simmons on 10/16/24.
//

import Foundation

struct FetchGamesByDateRequest: Encodable {
    let date: String
}

struct FetchGamesByDateResponse: Decodable {
    
    let gameInfos: [GameInfo]
    
    struct GameInfo: Decodable {
        let season: String
        let startDate: String
        let place: String
        let gameStatus: String
        let homeTeam: String
        let awayTeam: String
        let homeScores: [Int]
        let awayScores: [Int]
        let homeRHEB: [Int]
        let awayRHEB: [Int]
        let homeScore: Int
        let awayScore: Int
    }
}
