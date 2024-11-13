//
//  MockDataBuilder.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation

struct MockDataBuilder {
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
    
    static var mockSavedTerms: [TermEntry] {
        return [
            TermEntry(term: "Swift", definition: "A powerful programming language used for iOS and macOS development."),
            TermEntry(term: "Xcode", definition: "An integrated development environment (IDE) for macOS to develop software for Apple platforms."),
            TermEntry(term: "UIKit", definition: "A framework that provides the necessary infrastructure for iOS apps."),
            TermEntry(term: "CoreData", definition: "An object graph and persistence framework for macOS and iOS.")
        ]
    }
    
    static var mockHighlightInfo: [Highlight] {
        return [
            Highlight(
                title: "[KBO 하이라이트] 10.28 삼성 vs KIA | KS 5차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-28",
                thumbnail: "https://img.youtube.com/vi/8HyQHBYaROQ/maxresdefault.jpg",
                videoId: "8HyQHBYaROQ"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.26 KIA vs 삼성 | KS 4차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-26",
                thumbnail: "https://img.youtube.com/vi/uaK6e95za0w/maxresdefault.jpg",
                videoId: "uaK6e95za0w"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.25 KIA vs 삼성 | KS 3차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-25",
                thumbnail: "https://img.youtube.com/vi/KX9a8IufZzk/maxresdefault.jpg",
                videoId: "KX9a8IufZzk"
            )
        ]
    }
    
    static var mockTeamRank: TeamRank {
        return TeamRank(
            rank: "3",
            team: "LG",
            wins: "76",
            draws: "2",
            losses: "66",
            win_rate: "0.535")
    }
}
