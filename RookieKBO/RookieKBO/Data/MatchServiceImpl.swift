//
//  MatchServiceImpl.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

final class MatchServiceImpl: MatchServiceInterface {
    
    private let matchService: MatchServiceInterface
    
    init(matchService: MatchServiceInterface) {
        self.matchService = matchService
    }
    
    func fetchMatch() {
        // 서버에서 경기 받아오기
    }
}
