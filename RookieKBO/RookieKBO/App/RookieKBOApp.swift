//
//  RookieKBOApp.swift
//  RookieKBO
//
//  Created by crownjoe on 10/3/24.
//

import SwiftUI

@main
struct RookieKBOApp: App {
    
    var body: some Scene {
        WindowGroup {
            InitialScreenView()
                .environment(PathModel())
                .environment(MatchUseCase(matchService: MatchServiceImpl()))
                .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
                .environment(TermUseCase(termService: TermService(termDictionary: termDictionary)))
        }
    }
}
