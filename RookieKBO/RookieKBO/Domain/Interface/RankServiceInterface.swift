//
//  RankServiceInterface.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import Foundation

protocol RankServiceInterface {
    func fetchRanks() async -> Result<[TeamRank], Error>
}
