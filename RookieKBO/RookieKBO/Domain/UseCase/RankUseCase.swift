//
//  RankUseCase.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import Foundation

@Observable
final class RankUseCase {
    
    private let rankService: RankServiceInterface
    
    private(set) var state: State
    private(set) var ranks: [TeamRank]
    
    init(rankService: RankServiceInterface) {
        self.rankService = rankService
        self.ranks = []
        self.state = State(
            teamRanks: nil
        )
    }
}

// MARK: - State

extension RankUseCase {
    
    struct State {
        var teamRanks: [TeamRank]?
    }
}

// MARK: - UseCase Method

extension RankUseCase {
    
    // 서버에서 순위를 받아오는 함수
    func fetchRanks() async -> [TeamRank] {
        let result = await rankService.fetchRanks()
        switch result {
        case .success(let fetchedRanks):
            self.ranks = fetchedRanks
            updateTeamRanks(from: fetchedRanks)
            return fetchedRanks
        case .failure(let error):
            print(error)
            return []
        }
    }
    
    // state에 업데이트 함수
    func updateTeamRanks(from teamRanks: [TeamRank]) {
        state.teamRanks = teamRanks
    }
}

