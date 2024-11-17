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
    func updateUserDefaultsTeamObject(_ team: Team) {
        selectTeamService.updateUserDefaultsTeamObject(team)
    }
    
    /// 선택한 응원 팀 조회
    func getUserDefaultsTeamObject() -> Team? {
        return selectTeamService.getUserDefaultsTeamObject()
    }
}
