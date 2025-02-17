//
//  PathModel+ViewBuilder.swift
//  RookieKBO
//
//  Created by Simmons on 10/13/24.
//

import SwiftUI
import SwiftData

import SwiftUI

extension PathModel {

    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .onboarding:
            OnboardingView()
        case .selectTeam:
            SelectTeamView()
        case .highlight:
            HighlightView()
        case .videoTranscript:
            VideoTranscriptView()
        case .myPage:
            MyPageView()
        case .savedTerms:
            SavedTermsView()
        case .offSeason:
            OffSeasonView()
        case .teamRanks:
            TeamRanksListView()
        }
    }
    
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .teamRanking:
            TeamRanksListView()
        case .highlightTeamFilter:
            HighlightTeamFilterView()
        case .dDaySheet:
            DdayView()
        }
    }
}
