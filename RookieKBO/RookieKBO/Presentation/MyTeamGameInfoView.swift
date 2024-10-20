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
        // TODO: ZStack으로 수정 예정
        VStack {
            if let selectTeam = selectTeamUseCase.state.selectedTeam {
                HeaderView(team: selectTeam)
            }
            VStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    Text("우리 팀의 경기 일정")
                        .font(.Head.head2)
                    Spacer()
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
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
                    BeforeMyTeamGameView(games: pastGames)
                        .tag(GameTab.beforeList)
                    
                    // 오늘 경기 뷰
                    CurrentMyTeamGameView(games: todayGames)
                        .tag(GameTab.currentList)
                    
                    // 내일 경기 뷰
                    UpcomingMyTeamGameView(games: upCommingGames)
                        .tag(GameTab.upcomingList)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .padding(16)
        }
        .onAppear {
            if let selectTeam = UserDefaults.shared.string(forKey: "selectTeam") {
                print("팀: " + selectTeam)
            }
            if let selectTeamColor = UserDefaults.shared.string(forKey: "selectTeamColor") {
                print("tab 색상: " + selectTeamColor)
                teamColor = Color.teamColor(for: selectTeamColor) ?? .Brand.primary
            }
            if let selectedTeamObj = selectTeamUseCase.getUserDefaultsTeamObject() {
                print("UserDefaults selectedTeam : \(selectedTeamObj)")
            }
            if let selectedTeamObj = selectTeamUseCase.state.selectedTeam {
                print("selectTeamUseCase.state.selectedTeam : \(selectedTeamObj)")
            }
            
        }
        .navigationDestination(for: Screen.self) { screen in
            pathModel.build(screen)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - HearderView
// TODO: 팀별 헤더로 로고 수정 필요

private struct HeaderView: View {
    @Environment(PathModel.self) private var pathModel
    let team: Team
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(team.backgroundImage)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 250)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Image(.titleLogoWhite)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                    
                    Spacer()
                    
                    Button {
                        print("Go AllGameInfo View")
                        pathModel.push(.allGameInfo)
                    } label: {
                        Image(.logoCircle)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 32)
                    }
                    
                    Button {
                        // TODO: 새로고침 버튼 기능 구현
                        
                    } label: {
                        Image(.refreshCircle)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 32)
                    }
                }
                
                Text(team.name)
                    .font(.CustomTitle.customTitle1)
                    .foregroundStyle(.white)
            }
            .padding(12)
        }
    }
}

#Preview {
    MyTeamGameInfoView()
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}
