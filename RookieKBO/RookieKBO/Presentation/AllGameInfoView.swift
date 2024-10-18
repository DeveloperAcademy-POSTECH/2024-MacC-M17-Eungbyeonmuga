//
//  AllGameInfoView.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

struct AllGameInfoView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(PathModel.self) private var pathModel
    
    @State private var tab: GameTab = .currentList
    @State private var teamColor: Color = .Brand.primary
    
    var body: some View {
        @Bindable var pathModel = pathModel
        
        NavigationStack(path: $pathModel.path) {
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
                    BeforeGameView()
                        .tag(GameTab.beforeList)
                    
                    // 오늘 경기 뷰
                    CurrentGameView()
                        .tag(GameTab.currentList)
                    
                    // 내일 경기 뷰
                    UpcomingGameView()
                        .tag(GameTab.upcomingList)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .onAppear {
                if UserDefaults.shared.string(forKey: "selectTeam") == nil {
                    print("SelectTeamView로 이동")
                    pathModel.push(.selectTeam)
                } else if UserDefaults.shared.string(forKey: "selectTeam") != "전체 구단" {
                    print("MyTeamGameInfoView로 이동")
                    print("팀: " + UserDefaults.shared.string(forKey: "selectTeam")!)
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
            .navigationDestination(item: $pathModel.fullScreenCover) { fullScreen in
                pathModel.build(fullScreen)
            }
        }
    }
}

// MARK: - HearderView

private struct HeaderView: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("titleLogo")
                .resizable()
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
        .environment(PathModel())
}
