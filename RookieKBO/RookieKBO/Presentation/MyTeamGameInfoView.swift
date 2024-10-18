//
//  MyTeamGameInfoView.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

struct MyTeamGameInfoView: View {
    
    @Environment(PathModel.self) private var pathModel
    
    @State private var tab: GameTab = .currentList
    @State private var teamColor: Color = .Brand.primary
    
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
        .environment(PathModel())
}
