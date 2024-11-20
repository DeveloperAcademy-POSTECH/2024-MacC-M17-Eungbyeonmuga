//
//  VideoTranscript.swift
//  RookieKBO
//
//  Created by crownjoe on 11/6/24.
//

import Foundation

struct VideoTranscript: Codable {
    let videoId: String
    let transcript: [TranscriptItem]
}

struct TranscriptItem: Codable {
    let id: String
    let text: String
    let description: String?
    let start: Double
}
