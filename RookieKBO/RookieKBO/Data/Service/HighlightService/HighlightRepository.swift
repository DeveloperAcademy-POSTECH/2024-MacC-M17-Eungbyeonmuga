//
//  HighlightRepository.swift
//  RookieKBO
//
//  Created by Simmons on 11/30/24.
//

import Foundation

final class HighlightRepository {
    
    private let client = NetworkClient.shared
    
    /// 하이라이트 정보를 패치합니다.
    func fetchHighlight() async -> Result<FetchHighlightResponse, Error> {
        let url = APIs.RookieKBO.Highlight.fetchHighlight.url
        let response: Result<BaseResponse<FetchHighlightResponse>, Error> = await client.get(url: url)
        do {
            return try .success(response.get().result)
        } catch {
            return .failure(error)
        }
    }
}
