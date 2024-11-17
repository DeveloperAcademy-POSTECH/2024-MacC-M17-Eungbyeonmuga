//
//  NewsUseCase.swift
//  RookieKBO
//
//  Created by Simmons on 11/17/24.
//

import Foundation

@Observable
final class NewsUseCase {
    
    private let newsService: NewsServiceInterface
    
    private(set) var state: State
    
    init(newsService: NewsServiceInterface) {
        self.newsService = newsService
        self.state = State(
            totalNews: newsService.fetchMockTotalNews()
        )
    }
}

// MARK: - State

extension NewsUseCase {
    
    struct State {
        var totalNews: [News]?
    }
}

// MARK: - UseCase Method

extension NewsUseCase {
    
    // 함수 작성..
}
