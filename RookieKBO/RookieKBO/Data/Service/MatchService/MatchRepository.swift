//
//  MatchRepository.swift
//  RookieKBO
//
//  Created by crownjoe on 10/17/24.
//

import Foundation

final class MatchRepository {
    
    private let client = NetworkClient.shared
    
    func fetchMatchs(request: FetchMatchsRequest) async -> Result<FetchMatchsResponse, Error> {
        let url = APIs.RookieKBO.Matchs.fetchMatch.url
        let response: Result<BaseResponse<FetchMatchsResponse>, Error> = await client.post(url: url, body: request)
        do {
            return try .success(response.get().result)
        } catch {
            return .failure(error) 
        }
    }
}
