//
//  NewsServiceInterface.swift
//  RookieKBO
//
//  Created by Simmons on 11/17/24.
//

import Foundation

protocol NewsServiceInterface {
    func fetchNews() async -> Result<[News], Error>
    func fetchMockTotalNews() -> [News]
}
