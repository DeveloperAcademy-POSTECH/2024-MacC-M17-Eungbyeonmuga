//
//  RankServiceImpl.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import Foundation

final class RankServiceImpl: RankServiceInterface {
    
    private let rankRepository = RankRepository()
    
    /// 팀 순위를 불러옵니다.
    func fetchRanks() async -> Result<[TeamRank], Error> {
        let result = await rankRepository.fetchRanks()
        switch result {
        case .success(let fetchRanksResponse):
            let ranksResult = fetchRanksResponse.toRanks()
            switch ranksResult {
            case .success(let ranks):
                return .success(ranks)
            case .failure(let error):
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
