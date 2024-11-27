//
//  NewsRepository.swift
//  RookieKBO
//
//  Created by crownjoe on 11/27/24.
//

import Foundation

final class NewsRepository {
    
    private let client = NetworkClient.shared
    
    /// 뉴스 정보를 패치합니다.
    func fetchNews() async -> Result<FetchNewsResponse, Error> {
        let url = APIs.RookieKBO.News.fetchNews.url
        let response: Result<BaseResponse<FetchNewsResponse>, Error> = await client.get(url: url)
        do {
            return try .success(response.get().result)
        } catch {
            return .failure(error)
        }
    }
}
