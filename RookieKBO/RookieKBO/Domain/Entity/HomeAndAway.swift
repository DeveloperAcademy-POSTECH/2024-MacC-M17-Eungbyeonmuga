//
//  HomeAndAway.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/7/24.
//

import Foundation

enum HomeAndAway: Codable, CaseIterable {
    case HOME
    case AWAY
    
    var korean: String {
        switch self {
        case .HOME: return "홈"
        case .AWAY: return "어웨이"
        }
    }
}
