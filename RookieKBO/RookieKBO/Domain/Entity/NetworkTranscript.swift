//
//  Transcript.swift
//  RookieKBO
//
//  Created by crownjoe on 11/28/24.
//

import Foundation

struct NetworkTranscript: Codable {
    let videoId: String
    let videoTranscript: [VideoTranscriptItem]
}

struct VideoTranscriptItem: Codable {
    var id: String
    let text: String
    let start: Double
}
