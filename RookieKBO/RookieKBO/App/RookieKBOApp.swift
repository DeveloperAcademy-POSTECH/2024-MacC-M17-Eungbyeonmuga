//
//  RookieKBOApp.swift
//  RookieKBO
//
//  Created by crownjoe on 10/3/24.
//

import SwiftUI
import SwiftData

@main
struct RookieKBOApp: App {
    
    var body: some Scene {
        WindowGroup {
            InitialScreenView()
                .environment(PathModel())
                .environment(MatchUseCase(matchService: MatchServiceImpl()))
                .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
                .environment(HighlightUseCase(highlightService: HighlightServiceImpl()))
                .environment(RankUseCase(rankService: RankServiceImpl()))
                .environment(NewsUseCase(newsService: NewsServiceImpl()))
                .modelContainer(for: TermEntry.self)
        }
    }
}
