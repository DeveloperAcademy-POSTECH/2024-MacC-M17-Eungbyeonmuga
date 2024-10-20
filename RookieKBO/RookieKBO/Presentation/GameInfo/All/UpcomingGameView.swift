//
//  UpcomingGameView.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

struct UpcomingGameView: View {
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
            VStack(spacing: 0) {
                ForEach(gamesGroupedByDate.keys.sorted(), id: \.self) { date in
                    HStack(spacing: 0) {
                        DateLabel(date: date)
                        Spacer()
                    }
                    .padding(.vertical, 16)

                    ForEach(gamesGroupedByDate[date] ?? []) { game in
                        PreparingGameInfo(preparingGameInfo: game)
                            .padding(.bottom, 16)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    UpcomingGameView(games: MockDataBuilder.mockUpcommingGameList)
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}

