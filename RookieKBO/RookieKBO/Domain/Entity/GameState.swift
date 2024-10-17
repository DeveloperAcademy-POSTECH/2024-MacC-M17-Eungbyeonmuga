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
    
    // TODO: 서버 확인 후 변경
    var korean: String {
        switch self {
        case .PREPARE: return "준비"
        case .PLAYING: return "경기중"
        case .END: return "경기 종료"
        case .CANCEL: return "취소"
        }
    }
}
