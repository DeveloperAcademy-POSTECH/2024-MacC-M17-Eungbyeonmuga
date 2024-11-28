//
//  NewsServiceImpl.swift
//  RookieKBO
//
//  Created by Simmons on 11/17/24.
//

import Foundation

final class NewsServiceImpl: NewsServiceInterface {
    
    private let newsRepository = NewsRepository()
    
    /// 뉴스를 불러옵니다.
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
    
    func fetchMockTotalNews() -> [News] {
        return MockDataBuilder.mockEntireNews
    }
}
