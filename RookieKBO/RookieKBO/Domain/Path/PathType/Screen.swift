//
//  Screen.swift
//  RookieKBO
//
//  Created by Simmons on 10/13/24.
//

import Foundation

enum Screen: Identifiable, Hashable {
    
    var id: Self { self }
    
    case selectTeam
    case myTeamGameInfo
    case allGameInfo
    case highlight
    case videoTranscript
    case myPage
    case savedTerms
    case offSeason
    case teamRanks
}
