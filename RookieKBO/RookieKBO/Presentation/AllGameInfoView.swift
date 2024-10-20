//
//  AllGameInfoView.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

struct AllGameInfoView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(MatchUseCase.self) private var matchUseCase
    @Environment(PathModel.self) private var pathModel
    
    @State private var tab: GameTab = .currentList
    @State private var teamColor: Color = .Brand.primary
    
    // TODO: API 연결 이후 삭제 예정 -> UseCase 사용해서 State로 저장해야함.
    let games: [Match] = MockDataBuilder.mockMatchList
    
    var pastGames: [Match] {
        return games.filter { game in
            return matchUseCase.isDateInPast(game.startDateTime)
        }
    }
    
    var todayGames: [Match] {
        return games.filter { game in
            return matchUseCase.isDateToday(game.startDateTime)
        }
    }
    
    var upCommingGames: [Match] {
        return games.filter { game in
            return matchUseCase.isDateInFuture(game.startDateTime)
        }
    }
    
    var body: some View {
        @Bindable var pathModel = pathModel
        
        NavigationStack(path: $pathModel.path) {
            VStack(spacing: 0) {
                HeaderView()
                
                Spacer()
                    .frame(height: 8)
                
                CustomTabBar(
                    tab: tab,
                    teamColor: teamColor,
                    onTabSelected: { selectedTab in
                        tab = selectedTab
                    }
                )
                
                Spacer()
                    .frame(height: 32)
                
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
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            .onAppear {
                if UserDefaults.shared.string(forKey: "selectTeam") == nil {
                    print("SelectTeamView로 이동")
                    pathModel.push(.selectTeam)
                } else if UserDefaults.shared.string(forKey: "selectTeam") != "전체 구단" {
                    print("MyTeamGameInfoView로 이동")
                    print("팀-: " + UserDefaults.shared.string(forKey: "selectTeam")!)
                    
                    // TODO: 로그 추후 삭제 예정
                    print("selectTeamUseCase.state.selectedTeam : \(selectTeamUseCase.state.selectedTeam)")
                    
                    pathModel.push(.myTeamGameInfo)
                }
            }
            .onChange(of: UserDefaults.shared.string(forKey: "selectTeamColor")) { newColor in
                if let newColor = newColor {
                    teamColor = Color.teamColor(for: newColor) ?? .Brand.primary
                }
            }
            .navigationDestination(for: Screen.self) { screen in
                pathModel.build(screen)
            }
        }
    }
}

// MARK: - HearderView

private struct HeaderView: View {
    var body: some View {
        HStack(spacing: 0) {
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
    AllGameInfoView()
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}
