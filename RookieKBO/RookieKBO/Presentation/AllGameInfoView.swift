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
    
    // TODO: Brand.primary 컬러가 아닌 해당 팀의 컬러로 변경
    @State private var teamColor: Color = Brand.primary
    
    var body: some View {
        @Bindable var pathModel = pathModel
        NavigationStack(path: $pathModel.path) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image("titleLogo")
                        .resizable()
                        .frame(width: 150, height: 40)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                CustomTabBar(tab: $tab, teamColor: $teamColor)
                    .padding(8)
                
                TabView(selection: $tab) {
                    // 이전 경기 뷰
                    AllBeforeGameView()
                        .tag(GameTab.beforeList)
                    
                    // 오늘 경기 뷰
                    AllCurrentGameView()
                        .tag(GameTab.currentList)
                    
                    // 내일 경기 뷰
                    AllUpcomingGameView()
                        .tag(GameTab.upcomingList)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .onAppear {
                if UserDefaults.shared.string(forKey: "selectTeam") == nil {
                    print("SelectTeamView로 이동")
                    pathModel.push(Screen.selectTeam)
                } else {
                    if let selectTeamColor = UserDefaults.shared.string(forKey: "selectTeamColor") {
                        print("tab 색상: " + selectTeamColor)
                        teamColor = Color.teamColor(for: selectTeamColor) ?? Brand.primary
                    }
                }
            }
            .onChange(of: UserDefaults.shared.string(forKey: "selectTeamColor")) { newColor in
                if let newColor = newColor {
                    teamColor = Color.teamColor(for: newColor) ?? Brand.primary
                }
            }
            .navigationDestination(for: Screen.self) { screen in
                pathModel.build(screen)
            }
        }
    }
}

private struct CustomTabBar: View {
    
    @Binding var tab: GameTab
    @Binding var teamColor: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Spacer()
            
            // 이전 경기 버튼
            createTabButton(text: "이전 경기", color: teamColor, currentTab: .beforeList)
            
            // 오늘 경기 버튼
            createTabButton(text: "오늘 경기", color: teamColor, currentTab: .currentList)
            
            // 다음 경기 버튼
            createTabButton(text: "다음 경기", color: teamColor, currentTab: .upcomingList)
            
            Spacer()
        }
    }
    
    private func createTabButton(text: String, color: Color, currentTab: GameTab) -> some View {
        Button {
            tab = currentTab
        } label: {
            Text(text)
                .font(.Head.head4)
                .foregroundColor(tab == currentTab ? color : TextLabel.tab)
                .frame(width: 107, height: 36)
                .background(RoundedRectangle(cornerRadius: 99)
                    .fill(.clear)
                    .stroke(tab == currentTab ? color : .clear, lineWidth: 2))
        }
    }
}

enum GameTab {
    case beforeList // 이전 경기
    case currentList // 오늘 경기
    case upcomingList // 다음 경기
}

#Preview {
    AllGameInfoView()
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
}
