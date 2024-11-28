//
//  TranscriptServiceImpl.swift
//  RookieKBO
//
//  Created by crownjoe on 11/28/24.
//

import Foundation

final class TranscriptServiceImpl: TranscriptServiceInterface {
    
    private let transcriptRepository = TranscriptRepository()
    
    func fetchTranscript(videoId: String) async -> Result<NetworkTranscript, Error> {
        let request = FetchTranscriptRequest(videoId: videoId)
        let result = await transcriptRepository.fetchTranscript(request: request)
        switch result {
        case .success(let fetchTranscriptResponse):
            let transcriptResult = fetchTranscriptResponse.toTranscript()
            switch transcriptResult {
            case .success(let transcript):
                return .success(transcript)
                
            case .failure(let error):
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
