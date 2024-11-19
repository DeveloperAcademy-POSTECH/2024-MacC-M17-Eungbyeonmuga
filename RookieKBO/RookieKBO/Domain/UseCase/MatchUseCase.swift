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
    private(set) var matches: [Match]
    private(set) var selectedDate: Date?
    private(set) var isLoading: Bool
    
    init(matchService: MatchServiceInterface) {
        self.matches = []
        self.matchService = matchService
        self.state = State(
            PreparingGames: nil,
            PlayingGames: nil,
            EndGames: nil,
            CancelGames: nil
        )
        self.selectedDate = nil
        self.isLoading = false
    }
}

// MARK: - State

extension MatchUseCase {
    
    struct State {
        var PreparingGames: [Match]?
        var PlayingGames: [Match]?
        var EndGames: [Match]?
        var CancelGames: [Match]?
    }
}

// MARK: - UseCase Method

extension MatchUseCase {
    
    /// 예정 경기 업데이트
    func updatePreparingGames(_ games: [Match]) {
        state.PreparingGames = games
    }
    
    /// 진행중인 경기 업데이트
    func updatePlayingGames(_ games: [Match]) {
        state.PlayingGames = games
    }
    
    /// 종료 경기 업데이트
    func updateEndGames(_ games: [Match]) {
        state.EndGames = games
    }
    
    /// 취소 경기 업데이트
    func updateCancelGame(_ games: [Match]) {
        state.CancelGames = games
    }
    
    /// 점수 계산하는 함수
    func calculateScore(for match: Match, team: HomeAndAway) -> Int {
        matchService.calculateScore(for: match, team: team)
    }
    
    /// 전체 구단일 때 승패 계산하는 함수
    func getAllTeamResult(for teamScore: Int, otherScore: Int) -> AllMatchResult {
        matchService.getAllTeamResult(for: teamScore, otherScore: otherScore)
    }
    
    /// 선택한 팀이 있을 때 승패 계산하는 함수
    func getMyTeamResult(for teamScore: Int, otherScore: Int) -> MyTeamMatchResult {
        matchService.getMyTeamResult(for: teamScore, otherScore: otherScore)
    }
    
    /// 이닝 계산하는 함수
    func calculateInningText(for match: Match) -> String {
        matchService.calculateInningText(for: match)
    }
    
    // 점수 배열을 조정하는 메소드
    func adjustScores(_ scores: [Int], inning: ScoreBoardView.Inning) -> [String] {
        matchService.adjustScores(scores, inning: inning)
    }
  
    // 이전 경기 필터링 메소드
    func isDateInPast(_ date: Date) -> Bool {
        matchService.isDateInPast(date)
    }
    
    // 오늘 경기 필터링 메소드
    func isDateToday(_ date: Date) -> Bool {
        matchService.isDateToday(date)
    }
    
    // 이후 경기 필터링 메소드
    func isDateInFuture(_ date: Date) -> Bool {
        matchService.isDateInFuture(date)
    }
    
    // 내 팀 경기 필터링 메소드
    func isMyTeam(_ team: Team, _ myTeam: Team) -> Bool {
        matchService.isMyTeam(team, myTeam)
    }
  
    // date를 보내 해당 날짜의 경기 정보 반환
    func fetchMatches(date: String) async -> Result<[Match], Error> {
        let result = await matchService.fetchMatches(date: date)
        
        switch result {
        case .success(let fetchedMatches):
            self.matches = fetchedMatches
            print(fetchedMatches)
            return .success(fetchedMatches)
            
        case .failure(let error):
            print(error)
            return .failure(error)
        }
    }
    
    func fetchSelectedDate(_ selectedDate: Date?) {
        self.selectedDate = selectedDate
    }
    
    // 해당 날짜에 맞는 match 매칭
    func filterMatches(for selectedDate: Date, in matchInfo: [Match]) -> [Match] {
        matchService.filterMatches(for: selectedDate, in: matchInfo)
    }
    
    // 유효한 날짜인지 확인
    func isValidDate(_ date: Date) -> Bool {
        matchService.isValidDate(date)
    }
    
    // 포스트시즌 및 정규시즌 확인
    func getSeason() -> String {
        if selectedDate?.getSeasonType() == nil {
            return Date().getSeasonType()
        } else {
            return selectedDate!.getSeasonType()
        }
    }
    
    func isLoadingToggle() {
        self.isLoading.toggle()
    }
}
