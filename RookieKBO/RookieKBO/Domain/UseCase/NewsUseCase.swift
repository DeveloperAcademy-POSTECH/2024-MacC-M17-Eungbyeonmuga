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
    private(set) var news: [News]
    
    init(newsService: NewsServiceInterface) {
        self.newsService = newsService
        self.news = []
        self.state = State(
            totalNews: newsService.fetchMockTotalNews()
        )
    }
}

// MARK: - State

extension NewsUseCase {
    
    struct State {
        var totalNews: [News]
    }
}

// MARK: - UseCase Method

extension NewsUseCase {
    
    // 서버에서 뉴스를 받아오는 함수
    func fetchNews() async -> [News] {
        let result = await newsService.fetchNews()
        switch result {
        case .success(let fetchedNews):
            self.news = fetchedNews
            updateNews(from: fetchedNews)
            return fetchedNews
        case .failure(let error):
            print(error)
            return []
        }
    }
    
    // state에 업데이트 함수
    func updateNews(from news: [News]) {
        state.totalNews = news
    }
}
