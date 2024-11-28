//
//  TranscriptAPI.swift
//  RookieKBO
//
//  Created by crownjoe on 11/28/24.
//

import Foundation

struct FetchTranscriptRequest: Decodable {
    let videoId : String
}

struct FetchTranscriptResponse: Decodable {
    let videoId : String
    let transcript: [Transcript]
    
    struct Transcript: Decodable {
        let text: String
        let start: Double
    }
    
    func toTranscript() -> Result<NetworkTranscript, NetworkError> {
        let videoTranscriptItems = transcript.map { item in
            VideoTranscriptItem(
                id: "",
                text: item.text,
                start: item.start
            )
        }
        
        let result = NetworkTranscript(
            videoId: videoId,
            videoTranscript: videoTranscriptItems
        )
        
        return .success(result)
    }
}

