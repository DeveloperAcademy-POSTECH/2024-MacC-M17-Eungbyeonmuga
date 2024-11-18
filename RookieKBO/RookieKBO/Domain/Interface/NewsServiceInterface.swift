//
//  NewsServiceInterface.swift
//  RookieKBO
//
//  Created by Simmons on 11/17/24.
//

import Foundation

protocol NewsServiceInterface {
    func fetchTotalNews() -> [News]
    func fetchMockTotalNews() -> [News]
}
