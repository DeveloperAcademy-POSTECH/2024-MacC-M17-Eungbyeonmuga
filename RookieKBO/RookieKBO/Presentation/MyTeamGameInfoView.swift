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

#Preview {
    MyTeamGameInfoView()
        .environment(PathModel())
}
