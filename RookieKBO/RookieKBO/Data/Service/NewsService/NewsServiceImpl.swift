//
//  NewsServiceImpl.swift
//  RookieKBO
//
//  Created by Simmons on 11/17/24.
//

import Foundation

final class NewsServiceImpl: NewsServiceInterface {
    func fetchTotalNews() -> [News] {
        // TODO: 레퍼지토리 만들고 서버 통신
        return []
    }
    
    func fetchMockTotalNews() -> [News] {
        return MockDataBuilder.mockEntireNews
    }
}
