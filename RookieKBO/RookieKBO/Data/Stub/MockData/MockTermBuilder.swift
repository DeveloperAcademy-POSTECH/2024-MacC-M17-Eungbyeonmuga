//
//  MockTermBuilder.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation

struct MockTermBuilder {
    static var mockTranscript: VideoTranscript {
        return VideoTranscript(
            videoId: "video1",
            transcript: [
                TranscriptItem(text: "백투백 홈런", start: 0.0),
                TranscriptItem(text: "중견수", start: 5.5),
                TranscriptItem(text: "도루", start: 12.0),
                TranscriptItem(text: "홈런", start: 20.0),
                TranscriptItem(text: "사이클링 히트", start: 30.0),
            ]
        )
    }
}
