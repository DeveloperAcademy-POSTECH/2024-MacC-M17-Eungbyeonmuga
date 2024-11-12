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
                TranscriptItem(id: UUID(), text: "박성한이 백투백 홈런", start: 0.0),
                TranscriptItem(id: UUID(), text: "백투백 홈런", start: 10.0),
                TranscriptItem(id: UUID(), text: "중견수", start: 5.5),
                TranscriptItem(id: UUID(), text: "중견수", start: 15.5),
                TranscriptItem(id: UUID(), text: "박성한이 도루함", start: 12.0),
                TranscriptItem(id: UUID(), text: "도루", start: 22.0),
                TranscriptItem(id: UUID(), text: "박성한이 홈런", start: 20.0),
                TranscriptItem(id: UUID(), text: "홈런", start: 40.0),
                TranscriptItem(id: UUID(), text: "박성한이 사이클링 히트", start: 30.0),
                TranscriptItem(id: UUID(), text: "사이클링 히트", start: 100.0),
                TranscriptItem(id: UUID(), text: "사이클링 히트", start: 110.0),
            ]
        )
    }
}
