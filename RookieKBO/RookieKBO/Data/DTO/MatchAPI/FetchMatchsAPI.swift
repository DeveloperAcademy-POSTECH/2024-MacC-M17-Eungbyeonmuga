//
//  FetchMatchsAPI.swift
//  RookieKBO
//
//  Created by crownjoe on 10/17/24.
//

import Foundation

struct FetchMatchsRequest: Encodable {
    let date: String
}

struct FetchMatchsResponse: Decodable {
    let season: String
    let startDateTime: String
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
