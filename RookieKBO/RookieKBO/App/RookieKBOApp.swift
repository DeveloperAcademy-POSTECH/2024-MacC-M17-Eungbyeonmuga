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
    
    private let termService: TermServiceInterface
    
    init() {
        self.termService = TermServiceImpl(termDictionary: termDictionary)
    }
    
    var body: some Scene {
        WindowGroup {
            InitialScreenView()
                .environment(PathModel())
                .environment(MatchUseCase(matchService: MatchServiceImpl()))
                .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
                .environment(TermUseCase(termService: termService))
                .environment(HighlightUseCase(highlightService: HighlightServiceImpl()))
                .modelContainer(for: TermEntry.self)
        }
    }
}
