//
//  NewsServiceImpl.swift
//  RookieKBO
//
//  Created by Simmons on 11/17/24.
//

import Foundation

final class NewsServiceImpl: NewsServiceInterface {
    
    private let newsRepository = NewsRepository()
    
    /// 팀 순위를 불러옵니다.
    func fetchNews() async -> Result<[News], Error> {
        let result = await newsRepository.fetchNews()
        switch result {
        case .success(let fetchNewsResponse):
            let newsResult = fetchNewsResponse.toNews()
            switch newsResult {
            case .success(let news):
                return .success(news)
            case .failure(let error):
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func fetchTotalNews() -> [News] {
        // TODO: 레퍼지토리 만들고 서버 통신
        return []
    }
    
    func fetchMockTotalNews() -> [News] {
        return MockDataBuilder.mockEntireNews
    }
}
