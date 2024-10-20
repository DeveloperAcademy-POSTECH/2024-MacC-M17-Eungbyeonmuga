//
//  RookieKBOApp.swift
//  RookieKBO
//
//  Created by crownjoe on 10/3/24.
//

import SwiftUI

@main
struct RookieKBOApp: App {
    
    @State private var selectTeamUseCase = SelectTeamUseCase(selectTeamService: StubSelectTeamService())
    
    init() {
        if let selectedTeam = selectTeamUseCase.getUserDefaultsTeamObject() {
            selectTeamUseCase.toggleSelectedTeam(selectedTeam)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            AllGameInfoView()
                .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
                .environment(MatchUseCase(matchService: MatchServiceImpl()))
                .environment(PathModel())
        }
    }
}
