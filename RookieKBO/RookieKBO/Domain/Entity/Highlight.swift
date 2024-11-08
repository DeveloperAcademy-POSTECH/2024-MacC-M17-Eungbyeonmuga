//
//  Highlight.swift
//  RookieKBO
//
//  Created by Simmons on 11/8/24.
//

import Foundation

struct Highlight: Codable, Identifiable, Equatable {
    var id: UUID
    var title: String
    var date: String
    var thumbnail: String
    var videoId: String
    
    init(
        title: String,
        date: String,
        thumbnail: String,
        videoId: String
    ) {
        self.id = UUID()
        self.title = title
        self.date = date
        self.thumbnail = thumbnail
        self.videoId = videoId
    }
}
