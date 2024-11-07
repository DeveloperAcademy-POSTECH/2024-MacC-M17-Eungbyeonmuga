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
                TranscriptItem(text: "사이클링 히트", start: 40.0),
                TranscriptItem(text: "사이클링 히트", start: 60.0),
                TranscriptItem(text: "사이클링 히트", start: 80.0),
                TranscriptItem(text: "사이클링 히트", start: 87.0),
                TranscriptItem(text: "사이클링 히트", start: 90.0),
                TranscriptItem(text: "사이클링 히트", start: 100.0),
                TranscriptItem(text: "사이클링 히트", start: 110.0),
                TranscriptItem(text: "박성한", start: 12.0),
                TranscriptItem(text: "박성한", start: 30.0),
                TranscriptItem(text: "박성한", start: 40.0),
                TranscriptItem(text: "박성한", start: 60.0),
                TranscriptItem(text: "박성한", start: 80.0),
                TranscriptItem(text: "박성한", start: 87.0),
                TranscriptItem(text: "박성한", start: 90.0),
                TranscriptItem(text: "박성한", start: 100.0),
                TranscriptItem(text: "박성한", start: 110.0),
                TranscriptItem(text: "박성한", start: 20.0)
            ]
        )
    }
}
