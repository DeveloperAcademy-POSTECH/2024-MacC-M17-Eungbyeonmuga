//
//  RookieKBOAPI.swift
//  RookieKBO
//
//  Created by crownjoe on 10/17/24.
//

import Foundation

extension APIs.RookieKBO {
    
    /// Match API
    enum Matchs: RawRepresentable, API {

        static let baseUrl: URL = APIs.RookieKBO.baseURL.appendingPathComponent("games")
        
        case fetchMatch // 경기 조회
        
        var rawValue: RawValue {
            switch self {
            case .fetchMatch: return ""
            }
        }
    }
}
