//
//  SelectTeamUseCase.swift
//  RookieKBO
//
//  Created by Simmons on 10/8/24.
//

import Foundation

@Observable
final class SelectTeamUseCase {
    
    private let selectTeamService: SelectTeamServiceInterface
    
    private(set) var state: State
    
    init(selectTeamService: SelectTeamServiceInterface) {
        self.selectTeamService = selectTeamService
        
        let selectedTeam = selectTeamService.getUserDefaultsTeamObject()
        
        self.state = State(
            teams: selectTeamService.fetchAllTeam(),
            selectedTeam: selectedTeam
        )
    }
}

// MARK: - State

extension SelectTeamUseCase {
    
    struct State {
        var teams: [Team]
        var selectedTeam: Team?
    }
}

// MARK: - UseCase Method

extension SelectTeamUseCase {
    
    /// 선택한 응원 팀 state에 반영
    func fetchSelectedTeam(_ team: Team) {
        state.selectedTeam = team
    }
    
    /// 선택한 응원 팀 UserDefaults에 반영
    func updateUserDefaultsTeam() {
        selectTeamService.updateUserDefaultsTeam(state.selectedTeam?.name ?? "없음", state.selectedTeam?.color ?? "없음")
    }
    
    /// 선택한 응원 팀 UserDefaults에 반영
    func updateUserDefaultsTeamObject(_ team: Team) {
        selectTeamService.updateUserDefaultsTeamObject(team)
    }
    
    /// 선택한 응원 팀 조회
    func getUserDefaultsTeamObject() -> Team? {
        return selectTeamService.getUserDefaultsTeamObject()
    }
    
    func fetchSelectedTeamAsync(for team: Team) async {
        // 데이터를 가져오는 비동기 작업 수행
        await withCheckedContinuation { continuation in
            DispatchQueue.global().async {
                // 데이터를 로드한 후 SelectTeamState 업데이트
                DispatchQueue.main.async {
                    self.state.selectedTeam = team
                    continuation.resume()
                }
            }
        }
    }
}
