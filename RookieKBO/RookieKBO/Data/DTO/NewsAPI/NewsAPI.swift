//
//  NewsAPI.swift
//  RookieKBO
//
//  Created by crownjoe on 11/27/24.
//

import Foundation

struct FetchNewsResponse: Decodable {
    let articles: [Article]
    
    struct Article: Decodable {
        let title: String
        let imageUrl: String
        let publisher: String
        let link: String
    }
    
    func toNews() -> Result<[News], NetworkError> {
        let todayNews = articles.map { article in
            News(
                title: article.title,
                imageUrl: article.imageUrl,
                publisher: article.publisher,
                link: article.link
            )
        }
        return .success(todayNews)
    }
}
