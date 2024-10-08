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
            if teamScore > otherScore {
                return "승"
            } else if teamScore < otherScore {
                return "패"
            } else {
                return "무" 
            }
        }
    
    /// 이닝 계산하는 함수
    func calculateInningText(for match: Match) -> String {
        guard let homeScoreBoard = match.scoreBoard?.first(where: { $0.homeAndAway == .HOME }),
              let awayScoreBoard = match.scoreBoard?.first(where: { $0.homeAndAway == .AWAY }) else {
            return "이닝 정보 없음"
        }
        
        let homeInningCount = homeScoreBoard.scores.count
        let awayInningCount = awayScoreBoard.scores.count
        
        if homeInningCount == awayInningCount {
            return "\(homeInningCount)회 말"
        } else {
            return "\(awayInningCount)회 초"
        }
    }
}
