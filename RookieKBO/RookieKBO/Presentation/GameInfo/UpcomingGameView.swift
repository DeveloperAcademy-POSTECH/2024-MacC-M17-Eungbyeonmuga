//
//  UpcomingGameView.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

struct UpcomingGameView: View {
    let games: [Match]
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(games) { game in
                    PreparingGameInfo(preparingGameInfo: game)
                }
            }
        }
    }
}

#Preview {
    UpcomingGameView(games: MockDataBuilder.mockUpcommingGameList)
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}

