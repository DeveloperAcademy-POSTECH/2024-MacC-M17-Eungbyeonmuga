//
//  InitialScreenView.swift
//  RookieKBO
//
//  Created by Simmons on 11/4/24.
//

import SwiftUI

struct InitialScreenView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var body: some View {
        if selectTeamUseCase.state.selectedTeam == nil {
            SelectTeamScreenView()
        } else {
            TeamScreenView()
        }
    }
}

private struct SelectTeamScreenView: View {
    
    @Environment(PathModel.self) private var pathModel
    
    var body: some View {
        @Bindable var pathModel = pathModel
        
        NavigationStack(path: $pathModel.path) {
            pathModel.build(.selectTeam)
                .navigationDestination(for: Screen.self) { screen in
                    pathModel.build(screen)
                }
        }
    }
}

struct TeamScreenView: View {
    
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    @State private var selectedTab: Tab = .match
    
    var body: some View {
        @Bindable var pathModel = pathModel
        
        NavigationStack(path: $pathModel.path) {
            ZStack {
                TabView(selection: $selectedTab) {
//                    if selectTeamUseCase.state.selectedTeam?.name == "전체 구단" {
//                        pathModel.build(.allGameInfo)
//                            .tag(Tab.match)
//                    } else {
//                        pathModel.build(.myTeamGameInfo)
//                            .tag(Tab.match)
//                    }
                    pathModel.build(.offSeason)
                        .modifier(TabBarModifier(currentTab: selectedTab, selectedTab: .match))
                    
                    pathModel.build(.highlight)
                        .modifier(TabBarModifier(currentTab: selectedTab, selectedTab: .highlight))
                    
                    pathModel.build(.myPage)
                        .modifier(TabBarModifier(currentTab: selectedTab, selectedTab: .user))
                }
            }
            .tint(.brandPrimary)
            .sheet(item: $pathModel.sheet) { sheet in
                pathModel.build(sheet)
            }
            .navigationDestination(for: Screen.self) { screen in
                pathModel.build(screen)
            }
        }
    }
}

// MARK: - TabBarButton

private struct TabBarModifier: ViewModifier {
    
    let currentTab: Tab
    let selectedTab: Tab
    
    func body(content: Content) -> some View {
        content
            .tag(selectedTab)
            .tabItem {
                VStack {
                    // 선택된 탭에 따라 아이콘 변경
                    Image(currentTab == selectedTab ? selectedTab.selectedIcon : selectedTab.defaultIcon)
                        .resizable()
                        .frame(width: 32, height: 32)
                    
                    Text(selectedTab.title)
                        .font(.Caption.caption3b)
                }
            }
    }
}

#Preview {
    InitialScreenView()
        .environment(PathModel())
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
}
