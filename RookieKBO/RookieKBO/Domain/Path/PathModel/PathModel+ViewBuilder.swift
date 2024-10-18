//
//  PathModel+ViewBuilder.swift
//  webSocket
//
//  Created by Simmons on 10/13/24.
//

import SwiftUI

extension PathModel {
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .selectTeam:
            SelectTeamView()
        case .myTeamGameInfo:
            MyTeamGameInfoView()
        }
    }
    
    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .allGameInfo:
            AllGameInfoView()
        }
    }
}
