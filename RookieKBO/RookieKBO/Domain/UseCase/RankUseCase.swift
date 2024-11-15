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
    private(set) var currentRankIndex: Int
    
    private var timer: Timer?
    
    
    init(rankService: RankServiceInterface) {
        self.rankService = rankService
        self.ranks = []
        self.currentRankIndex = 0
        self.state = State(
            teamRanks: nil,
            currentRank: nil
        )
    }
}

// MARK: - State

extension RankUseCase {
    
    struct State {
        var teamRanks: [TeamRank]?
        var currentRank: TeamRank?
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
    
    func startTimer() {
        // 기존 타이머 종료
        stopTimer()
        
        guard !ranks.isEmpty else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.currentRankIndex = (self.currentRankIndex + 1) % self.ranks.count
            self.state.currentRank = self.ranks[self.currentRankIndex]
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

