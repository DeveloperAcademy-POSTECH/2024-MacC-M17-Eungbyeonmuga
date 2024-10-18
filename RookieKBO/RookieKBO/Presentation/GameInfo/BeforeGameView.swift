//
//  BeforeGameView.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

struct BeforeGameView: View {
    let games: [Match]
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(games) { game in
                    EndGameInfo(endGameInfo: game)
                }
            }
        }
    }
}

#Preview {
    BeforeGameView(games: MockDataBuilder.mockEndGameList)
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}
