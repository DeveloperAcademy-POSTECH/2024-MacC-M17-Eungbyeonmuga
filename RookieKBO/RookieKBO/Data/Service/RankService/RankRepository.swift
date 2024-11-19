//
//  RankRepository.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import Foundation

final class RankRepository {
    
    private let client = NetworkClient.shared
    
    /// Ranks 정보를 패치합니다.
    func fetchRanks() async -> Result<FetchRanksResponse, Error> {
        let url = APIs.RookieKBO.Teams.fetchRanks.url
        let response: Result<BaseResponse<FetchRanksResponse>, Error> = await client.get(url: url)
        do {
            return try .success(response.get().result)
        } catch {
            return .failure(error)
        }
    }
}
