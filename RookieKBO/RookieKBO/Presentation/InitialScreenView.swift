//
//  InitialScreenView.swift
//  RookieKBO
//
//  Created by Simmons on 11/4/24.
//

import SwiftUI

struct InitialScreenView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @State private var showSplash: Bool = true
    
    var body: some View {
        VStack {
            if showSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                if selectTeamUseCase.state.selectedTeam == nil {
                    SelectTeamScreenView()
                } else {
                    TeamScreenView()
                }
            }
        }
        .transition(.opacity) 
    }
}


private struct SelectTeamScreenView: View {
    
    @Environment(PathModel.self) private var pathModel
    
    var body: some View {
        @Bindable var pathModel = pathModel
        
        NavigationStack(path: $pathModel.path) {
            if !UserDefaults.standard.bool(forKey: "NotFirstRun") {
                pathModel.build(.onboarding)
                    .navigationDestination(for: Screen.self) { screen in
                        pathModel.build(screen)
                    }
            } else {
                pathModel.build(.selectTeam)
                    .navigationDestination(for: Screen.self) { screen in
                        pathModel.build(screen)
                    }
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
                    pathModel.build(.offSeason)
                        .modifier(TabBarModifier(currentTab: selectedTab, selectedTab: .match))
                    
                    pathModel.build(.highlight)
                        .modifier(TabBarModifier(currentTab: selectedTab, selectedTab: .highlight))
                    
                    pathModel.build(.myPage)
                        .modifier(TabBarModifier(currentTab: selectedTab, selectedTab: .user))
                }
            }
            .tint(Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "allTeam"))
            .sheet(item: $pathModel.sheet) { sheet in
                pathModel.build(sheet)
            }
            .navigationDestination(for: Screen.self) { screen in
                pathModel.build(screen)
            }
            .onOpenURL(perform: { (url) in
                if url.absoluteString == "rookiekbo://highlight" {
                    selectedTab = .highlight
                }
            })
        }
    }
}

// MARK: - TabBarButton

private struct TabBarModifier: ViewModifier {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    let currentTab: Tab
    let selectedTab: Tab
    
    func body(content: Content) -> some View {
        content
            .tag(selectedTab)
            .tabItem {
                VStack(spacing: 0) {
                    // 선택된 탭에 따라 아이콘 변경
                    Image(currentTab == selectedTab ? "\(selectTeamUseCase.state.selectedTeam?.color ?? "allTeam")\(selectedTab.selectedIcon)" : selectedTab.defaultIcon)
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
        .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
}
