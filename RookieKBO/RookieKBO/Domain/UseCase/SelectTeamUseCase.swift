//
//  SelectTeamUseCase.swift
//  RookieKBO
//
//  Created by Simmons on 10/8/24.
//

import Foundation

final class SelectTeamUseCase : ObservableObject {
    
    private(set) var state: State
    
    init() {
        self.state = State(
            teams: [
                Team(name: "SSG 랜더스", image: "ssgUnder"),
                Team(name: "KIA 타이거즈", image: "kiaUnder"),
                Team(name: "KT 위즈", image: "ktUnder"),
                Team(name: "LG 트윈스", image: "lgUnder"),
                Team(name: "NC 다이노스", image: "ncUnder"),
                Team(name: "두산 베어스", image: "doosanUnder"),
                Team(name: "롯데 자이언츠", image: "lotteUnder"),
                Team(name: "삼성 라이온즈", image: "samsungUnder"),
                Team(name: "키움 히어로즈", image: "kiwoomUnder"),
                Team(name: "한화 이글즈", image: "hanwhaUnder"),
                Team(name: "전체 구단", image: "allTeamUnder")],
            selectedTeam: nil
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
    
    // 선택한 응원 팀 토글 함수
    func toggleSelectedTeam(_ team: Team) {
        if state.selectedTeam == team {
            state.selectedTeam = nil
        } else {
            state.selectedTeam = team
        }
        objectWillChange.send()
    }
}
