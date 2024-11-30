//
//  HighlightAPI.swift
//  RookieKBO
//
//  Created by Simmons on 11/30/24.
//

import Foundation

struct FetchHighlightResponse: Decodable {
    let videos: [videoInfo]
    
    struct videoInfo: Decodable {
        let title: String
        let date: String
        let thumbnail: String
        let videoId: String
        let homeTeam: String
        let awayTeam: String
    }
    
    func toHighlight() -> Result<[Highlight], NetworkError> {
        let highlights = videos.map { video in
            Highlight(
                title: video.title,
                date: video.date,
                thumbnail: video.thumbnail,
                videoId: video.videoId
            )
        }
        
        return .success(highlights)
    }
}
