//
//  TranscriptRepository.swift
//  RookieKBO
//
//  Created by crownjoe on 11/28/24.
//

import Foundation

final class TranscriptRepository {
    
    private let client = NetworkClient.shared
    
    /// 자막 정보를 패치합니다.
    func fetchTranscript(request: FetchTranscriptRequest) async -> Result<FetchTranscriptResponse, Error> {
        let url = APIs.RookieKBO.Subtitle.fetchSubtitle.url.appendingPathComponent(request.videoId)
        let response: Result<BaseResponse<FetchTranscriptResponse>, Error> = await client.get(url: url)
        do {
            return try .success(response.get().result)
        } catch {
            return .failure(error)
        }
    }
}
