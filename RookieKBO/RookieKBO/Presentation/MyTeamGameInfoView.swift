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
    
    @State private var isAllGameInfoFullScreenPresented = false
    
    // TODO: API 연결 이후 삭제 예정 -> UseCase 사용해서 State로 저장해야함.
    let games: [Match] = MockDataBuilder.mockMatchList
    
    var myTeamGames: [Match] {
        return games.filter { game in
            if let selectedTeamName = selectTeamUseCase.state.selectedTeam {
                return matchUseCase.isMyTeam(game.homeTeam, selectedTeamName) || matchUseCase.isMyTeam(game.awayTeam, selectedTeamName)
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
        ZStack {
            if let selectTeam = selectTeamUseCase.state.selectedTeam {
                HeaderView(isAllGameInfoFullScreenPresented: $isAllGameInfoFullScreenPresented, team: selectTeam)
            }
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 16) {
                        Image(.titleLogoWhite)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                        
                        Spacer()
                        
                        Button {
                            print("Go AllGameInfo View")
                            isAllGameInfoFullScreenPresented = true
                        } label: {
                            Image(.logoCircle)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 32)
                        }
                        
                        Button {
                            pathModel.push(.selectTeam)
                        } label: {
                            Image(.refreshCircle)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 32)
                        }
                    }
                    .padding(.horizontal, 32)
                    
                    Text(selectTeamUseCase.state.selectedTeam?.name ?? "")
                        .font(.CustomTitle.customTitle1)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 32)
                    
                    Spacer()
                }
                .frame(height: 240)
                
                VStack(spacing: 0) {
                    
                    HStack(spacing: 0) {
                        Text("우리 팀의 경기 일정")
                            .font(.Head.head6)
                        Spacer()
                    }
                    .padding(.init(top: 24, leading: 32, bottom: 16, trailing: 0))
                    
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
                    .padding(.horizontal, 32)
                }
                .background(RoundedRectangle(cornerRadius: 24)
                    .fill(Color.Background.first))
                .ignoresSafeArea(edges: .all)
            }
        }
        .onAppear {
            if let selectedTeamObj = selectTeamUseCase.getUserDefaultsTeamObject() {
                teamColor = Color.teamColor(for: selectedTeamObj.color) ?? .Brand.primary
                print("UserDefaults selectedTeam : \(selectedTeamObj)")
            }
            if let selectedTeamObj = selectTeamUseCase.state.selectedTeam {
                print("selectTeamUseCase.state.selectedTeam : \(selectedTeamObj)")
            }
        }
        .fullScreenCover(isPresented: $isAllGameInfoFullScreenPresented) {
            AllGameInfoView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - HearderView
// TODO: 팀별 헤더로 로고 수정 필요

private struct HeaderView: View {
    
    @Environment(PathModel.self) private var pathModel
    
    @Binding var isAllGameInfoFullScreenPresented: Bool
    
    let team: Team
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(team.backgroundImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
//                .ignoresSafeArea()
        }
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    MyTeamGameInfoView()
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}
