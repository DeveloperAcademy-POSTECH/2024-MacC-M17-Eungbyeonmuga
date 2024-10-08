//
//  MatchUseCase.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

@Observable
final class MatchUseCase {
    
    private let matchService: MatchServiceInterface
    
    private(set) var state: State
    
    init(matchService: MatchServiceInterface) {
        self.matchService = matchService
        self.state = State(
            PreparingGame: nil,
            PlayingGame: nil,
            EndGame: nil,
            CancelGame: nil
        )
    }
}

// MARK: - State

extension MatchUseCase {
    
    struct State {
        var PreparingGame: Match?
        var PlayingGame: Match?
        var EndGame: Match?
        var CancelGame: Match?
    }
}

// MARK: - UseCase Method

extension MatchUseCase {
    
    /// 예정 경기 업데이트
    func updatePreparingGame(_ match: Match) {
        state.PreparingGame = match
    }
    
    /// 진행중인 경기 업데이트
    func updatePlayingGame(_ match: Match) {
        state.PlayingGame = match
    }
    
    /// 종료 경기 업데이트
    func updateEndGame(_ match: Match) {
        state.EndGame = match
    }
    
    /// 취소 경기 업데이트
    func updateCancelGame(_ match: Match) {
        state.CancelGame = match
    }
    
    /// 점수 계산하는 함수
    func calculateScore(for match: Match, team: HomeAndAway) -> Int {
        matchService.calculateScore(for: match, team: team)
    }
    
    /// 승, 패 계산하는 함수
    func getResult(for teamScore: Int, otherScore: Int) -> String {
        matchService.getResult(for: teamScore, otherScore: otherScore)
    }
    
    /// 이닝 계산하는 함수
    func calculateInningText(for match: Match) -> String {
        matchService.calculateInningText(for: match)
    }
    
    // 점수 배열을 조정하는 메소드
    func adjustScores(_ scores: [Int]) -> [String] {
        matchService.adjustScores(scores)
    }
}
