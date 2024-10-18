//
//  GameState.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/7/24.
//

import Foundation

enum GameState: String, Codable, CaseIterable {
    case PREPARE
    case PLAYING
    case END
    case CANCEL
    
    var korean: String {
        switch self {
        case .PREPARE: return "경기 예정"
        case .PLAYING: return "경기 중"
        case .END: return "경기 종료"
        case .CANCEL: return "경기 취소"
        }
    }
}
