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
        case .selectTeam:
            SelectTeamView()
        case .myTeamGameInfo:
            MyTeamGameInfoView()
        case .allGameInfo:
            AllGameInfoView()
        case .highlight:
            HighlightView()
        case .videoTranscript:
            VideoTranscriptView()
        case .myPage:
            MyPageView()
        case .savedTerms:
            SavedTermsView()
        }
    }
}
