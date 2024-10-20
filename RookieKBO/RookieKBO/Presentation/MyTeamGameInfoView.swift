//
//  MyTeamGameInfoView.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

struct MyTeamGameInfoView: View {
    
    @Environment(PathModel.self) private var pathModel
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(MatchUseCase.self) private var matchUseCase
    
    @State private var tab: GameTab = .currentList
    @State private var teamColor: Color = .Brand.primary
    
    // TODO: API 연결 이후 삭제 예정 -> UseCase 사용해서 State로 저장해야함.
    let games: [Match] = MockDataBuilder.mockMatchList
    
    var myTeamGames: [Match] {
        return games.filter { game in
            if let selectedTeamName = selectTeamUseCase.state.selectedTeam {
                return matchUseCase.isMyTeam(game.homeTeam, selectedTeamName)
            }
            return false
        }
    }
    
    var pastGames: [Match] {
        return myTeamGames.filter { game in
            return matchUseCase.isDateInPast(game.startDateTime)
        }
    }
    
    var todayGames: [Match] {
        return myTeamGames.filter { game in
            return matchUseCase.isDateToday(game.startDateTime)
        }
    }
    
    var upCommingGames: [Match] {
        return myTeamGames.filter { game in
            return matchUseCase.isDateInFuture(game.startDateTime)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            
            CustomTabBar(
                tab: tab,
                teamColor: teamColor,
                onTabSelected: { selectedTab in
                    tab = selectedTab
                }
            )
            .padding(8)
            
            TabView(selection: $tab) {
                // 이전 경기 뷰
                BeforeGameView(games: pastGames)
                    .tag(GameTab.beforeList)
                
                // 오늘 경기 뷰
                CurrentGameView(games: todayGames)
                    .tag(GameTab.currentList)
                
                // 내일 경기 뷰
                UpcomingGameView(games: upCommingGames)
                    .tag(GameTab.upcomingList)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .onAppear {
            if let selectTeam = UserDefaults.shared.string(forKey: "selectTeam") {
                print("팀: " + selectTeam)
            }
            if let selectTeamColor = UserDefaults.shared.string(forKey: "selectTeamColor") {
                print("tab 색상: " + selectTeamColor)
                teamColor = Color.teamColor(for: selectTeamColor) ?? .Brand.primary
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - HearderView
// TODO: 팀별 헤더로 로고 수정 필요

private struct HeaderView: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("팀별 헤더로 로고 수정 필요")
            Text(UserDefaults.shared.string(forKey: "selectTeam") ?? "X")
            Image(.titleLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 40)
            
            Spacer()
            // TODO: 응원 팀 선택뷰 이동 버튼 구현
        }
        .padding(.horizontal)
    }
}

#Preview {
    MyTeamGameInfoView()
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}
