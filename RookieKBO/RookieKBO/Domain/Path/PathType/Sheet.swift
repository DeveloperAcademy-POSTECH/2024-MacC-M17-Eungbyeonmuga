//
//  Sheet.swift
//  RookieKBO
//
//  Created by crownjoe on 11/15/24.
//

import Foundation

enum Sheet: Identifiable, Hashable {
    
    // 트랙
    case teamRanking
    case highlightTeamFilter
    
    var id: Self { self }
}
