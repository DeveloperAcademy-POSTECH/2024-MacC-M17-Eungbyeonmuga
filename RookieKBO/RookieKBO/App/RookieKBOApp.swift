//
//  RookieKBOApp.swift
//  RookieKBO
//
//  Created by crownjoe on 10/3/24.
//

import SwiftUI

@main
struct RookieKBOApp: App {
    
    @State private var selectTeamUseCase: SelectTeamUseCase = .init(selectTeamService: StubSelectTeamService())
    
    @State private var matchUseCase: MatchUseCase = .init(matchService: MatchServiceImpl())
    
    @State private var pathModel: PathModel = .init()
    
    init() {
        print("응원 팀 조회를 시작합니다.")
        if let team = selectTeamUseCase.getUserDefaultsTeamObject() {
            selectTeamUseCase.fetchSelectedTeam(team)
            print(team)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if let selectTeam = selectTeamUseCase.state.selectedTeam {
                if selectTeam.name == "전체 구단" {
                    AllGameInfoView()
                } else {
                    MyTeamGameInfoView()
                }
            } else {
                SelectTeamView()
            }
        }
        .environment(selectTeamUseCase)
        .environment(matchUseCase)
        .environment(pathModel)
    }
}
