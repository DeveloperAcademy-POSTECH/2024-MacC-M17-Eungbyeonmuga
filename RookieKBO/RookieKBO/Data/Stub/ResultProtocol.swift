//
//  ResultProtocol.swift
//  RookieKBO
//
//  Created by crownjoe on 10/15/24.
//

import SwiftUI

protocol ResultProtocol {
    var color: Color { get }
    var description: String { get }
}

enum AllMatchResult: ResultProtocol {
    case win
    case lose
    case draw
    
    var color: Color {
        switch self {
        case .win:
            return .brandPrimary
        case .lose:
            return .gray5
        case .draw:
            return .brandPrimaryGd
        }
    }
    
    var description: String {
        switch self {
        case .win:
            return "승"
        case .lose:
            return "패"
        case .draw:
            return "무"
        }
    }
}

enum MyTeamMatchResult {
    case win
    case lose
    case draw
    
    var description: String {
        switch self {
        case .win:
            return "승"
        case .lose:
            return "패"
        case .draw:
            return "무"
        }
    }
}
