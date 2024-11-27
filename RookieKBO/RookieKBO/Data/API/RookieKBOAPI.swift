//
//  RookieKBOAPI.swift
//  RookieKBO
//
//  Created by crownjoe on 10/17/24.
//

import Foundation

extension APIs.RookieKBO {
    
    /// Match API
    enum Matches: RawRepresentable, API {

        static let baseUrl: URL = APIs.RookieKBO.baseURL.appendingPathComponent("games")
        
        case fetchMatch // 경기 조회
        
        var rawValue: RawValue {
            switch self {
            case .fetchMatch: return ""
            }
        }
    }
    
    /// Rank  API
    enum Teams: RawRepresentable, API {

        static let baseUrl: URL = APIs.RookieKBO.baseURL.appendingPathComponent("teams")
        
        case fetchRanks // 팀 랭킹 조회
        
        var rawValue: RawValue {
            switch self {
            case .fetchRanks: return "/rank"
            }
        }
    }
    
    /// News  API
    enum News: RawRepresentable, API {

        static let baseUrl: URL = APIs.RookieKBO.tempUrl.appendingPathComponent("news")
        
        case fetchNews
        
        var rawValue: RawValue {
            switch self {
            case .fetchNews: return ""
            }
        }
    }
}
