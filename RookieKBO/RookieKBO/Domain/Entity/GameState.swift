//
//  State.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/7/24.
//

import Foundation

enum GameState: Codable, CaseIterable {
    case PREPARE
    case PLAYING
    case END
    case CANCEL
    
    var korean: String {
        switch self {
        case .PREPARE: return "준비"
        case .PLAYING: return "경기중"
        case .END: return "종료"
        case .CANCEL: return "취소"
        }
    }
}
