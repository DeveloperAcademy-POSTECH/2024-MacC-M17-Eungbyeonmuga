//
//  Screen.swift
//  RookieKBO
//
//  Created by Simmons on 10/13/24.
//

import Foundation

enum Screen: Identifiable, Hashable {
    
    var id: Self { self }
    
    case onboarding
    case selectTeam
    case highlight
    case videoTranscript
    case myPage
    case savedTerms
    case offSeason
    case teamRanks
}
