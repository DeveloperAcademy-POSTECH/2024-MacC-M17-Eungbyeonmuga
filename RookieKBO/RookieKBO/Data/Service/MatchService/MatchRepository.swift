//
//  MatchRepository.swift
//  RookieKBO
//
//  Created by crownjoe on 10/17/24.
//

import Foundation

final class MatchRepository {
    
    private let client = NetworkClient.shared
    
    /// Match 정보를 패치합니다.
    func fetchMatches(request: FetchMatchesRequest) async -> Result<FetchMatchesResponse, Error> {
        let url = APIs.RookieKBO.Matches.fetchMatch.url.appendingPathComponent(request.date)
        let response: Result<BaseResponse<FetchMatchesResponse>, Error> = await client.get(url: url)
        do {
            return try .success(response.get().result)
        } catch {
            return .failure(error)
        }
    }
}
