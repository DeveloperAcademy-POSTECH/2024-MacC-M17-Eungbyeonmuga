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
                    if selectTeamUseCase.state.selectedTeam?.name == "전체 구단" {
                        pathModel.build(.allGameInfo)
                            .tag(Tab.match)
                    } else {
                        pathModel.build(.myTeamGameInfo)
                            .tag(Tab.match)
                    }
                    
                    pathModel.build(.highlight)
                        .tag(Tab.highlight)
                    
                    pathModel.build(.myPage)
                        .tag(Tab.user)
                }
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    TabBar(selectedTab: $selectedTab)
                        .frame(height: 60)
                }
            }
            .navigationDestination(for: Screen.self) { screen in
                pathModel.build(screen)
            }
        }
    }
}

// MARK: - TabBar

private struct TabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(selectedTab: $selectedTab, tab: .match)
            Spacer()
            TabBarButton(selectedTab: $selectedTab, tab: .highlight)
            Spacer()
            TabBarButton(selectedTab: $selectedTab, tab: .user)
        }
        .padding(.horizontal, 44)
        .padding(.vertical)
        .background(Color.gray1)
    }
}

// MARK: - TabBarButton

private struct TabBarButton: View {
    @Binding var selectedTab: Tab
    let tab: Tab
    
    var body: some View {
        VStack {
            Image(selectedTab == tab ? tab.selectedIcon : tab.defaultIcon)
                .resizable()
                .frame(width: 32, height: 32)
            
            Text(tab.title)
                .font(.Caption.caption3b)
                .foregroundColor(selectedTab == tab ? .brandPrimary : .gray6)
        }
        .onTapGesture {
            selectedTab = tab
        }
    }
}

#Preview {
    InitialScreenView()
        .environment(PathModel())
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
}
