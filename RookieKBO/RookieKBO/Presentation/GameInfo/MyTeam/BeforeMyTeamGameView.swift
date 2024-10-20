//
//  BeforeMyTeamGameView.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/20/24.
//

import SwiftUI

struct BeforeMyTeamGameView: View {
    let games: [Match]

    // TODO: 중복되는 코드 UseCase로 함수화시킬 것
    var gamesGroupedByDate: [Date: [Match]] {
        let calendar = Calendar.current
        let groupedGames = Dictionary(grouping: games) { game -> Date in
            return calendar.startOfDay(for: game.startDateTime)
        }
        return groupedGames
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(gamesGroupedByDate.keys.sorted(), id: \.self) { date in
                    HStack(spacing: 0) {
                        DateLabel(date: date)
                        Spacer()
                    }
                    .padding(.top)

                    ForEach(gamesGroupedByDate[date] ?? []) { game in
                        EndGameInfo(endGameInfo: game)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    BeforeMyTeamGameView(games: MockDataBuilder.mockEndGameList)
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}
