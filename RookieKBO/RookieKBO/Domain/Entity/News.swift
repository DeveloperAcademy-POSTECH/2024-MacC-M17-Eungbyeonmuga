//
//  News.swift
//  RookieKBO
//
//  Created by Simmons on 11/16/24.
//

import Foundation

struct News: Codable, Identifiable {
    var id: UUID
    var title: String
    var imageUrl: String
    var publisher: String
    var link: String
    
    init(
        id: UUID,
        title: String,
        imageUrl: String,
        publisher: String,
        link: String
    ) {
        self.id = UUID()
        self.title = title
        self.imageUrl = imageUrl
        self.publisher = publisher
        self.link = link
    }
}
