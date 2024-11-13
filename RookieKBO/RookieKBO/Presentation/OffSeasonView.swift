//
//  OffSeasonView.swift
//  RookieKBO
//
//  Created by Simmons on 11/13/24.
//

import SwiftUI

struct OffSeasonView: View {
    
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(MatchUseCase.self) private var matchUseCase
    
    var body: some View {
        ZStack {
            // 상단 배경
            Image(.allTeamBg)
                .resizable()
                .ignoresSafeArea()
            
            // 하단 배경
            Color.gray1
                .ignoresSafeArea(edges: .bottom)
                .offset(y: UIScreen.main.bounds.height / 3)
            
            GameInfoView()
                .clipped()
        }
    }
}

// MARK: - GameInfoView

private struct GameInfoView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                Section(header: HeaderView()) {
                    OffSeasonInfoView()
                    ContentView()
                }
            }
        }
    }
}

// MARK: - HeaderView

private struct HeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(.titleLogoWhite)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140)
                
                // TODO: 자막화면과 크기 맞추기
                Spacer()
            }
            .padding()
        }
        .background(.brandPrimary)
    }
}

// MARK: - OffSeasonInfoView

private struct OffSeasonInfoView: View {
    
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 133)
            
            HStack(spacing: 8) {
                HStack(spacing: 8) {
                    Text("KBO 개막")
                    Rectangle()
                        .frame(width: 2, height: 16)
                    // TODO: 개막일 설정
                    Text("D-137")
                }
                .font(.Body.body1)
                .foregroundColor(.white0)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(.brandPrimaryGd.opacity(0.8)))
                
                HStack(spacing: 8) {
                    Text("순위")
                    Rectangle()
                        .frame(width: 2, height: 16)
                    // TODO: 순위 설정
                    Text(selectTeamUseCase.state.selectedTeam?.name ?? "전체 구단")
                }
                .font(.Body.body1)
                .foregroundColor(.white0)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(.brandPrimaryGd.opacity(0.8)))
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 24)
        }
    }
}

// MARK: - ContentView

private struct ContentView: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    // TODO: API 연결 이후 삭제 예정 -> UseCase 사용해서 State로 저장해야함.
    let games: [Match] = MockDataBuilder.mockMatchList
    
    var myTeamGames: [Match] {
        return games.filter { game in
            guard let selectedTeam = selectTeamUseCase.state.selectedTeam else { return false }
            
            // 전체 구단 선택 시 모든 게임 반환
            if selectedTeam.name == "전체 구단" {
                return true
            } else {
                // 선택된 팀과 관련된 경기만 필터링
                return matchUseCase.isMyTeam(game.homeTeam, selectedTeam) || matchUseCase.isMyTeam(game.awayTeam, selectedTeam)
            }
        }
    }

    var otherTeamGames: [Match] {
        return games.filter { game in
            guard let selectedTeam = selectTeamUseCase.state.selectedTeam else { return true }
            
            // 전체 구단 선택 시 다른 팀 게임을 필터링 x
            if selectedTeam.name == "전체 구단" {
                return false
            } else {
                // 선택된 팀과 관련 없는 경기만 필터링
                return !(matchUseCase.isMyTeam(game.homeTeam, selectedTeam) || matchUseCase.isMyTeam(game.awayTeam, selectedTeam))
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            DateInfoView()
            
            HStack(spacing: 0) {
                Text("종료된 경기")
                    .font(.Body.body1)
                    .foregroundColor(.gray7)
                
                Spacer()
                
                Text("스탯티즈 출처")
                    .font(.Body.body5)
                    .foregroundColor(.gray5)
            }
            .padding(.vertical)
            
//            if selectTeamUseCase.state.selectedTeam?.name == "전체 구단" {
                ForEach(games) { game in
                    EndGameInfo(endGameInfo: game)
                        .padding(.vertical, 4)
                }
//            }
            
        }
        .padding()
        .background(.gray1)
    }
}

// MARK: - DateInfoView

private struct DateInfoView: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    var body: some View {
        HStack(spacing: 8) {
            HStack(alignment: .bottom, spacing: 8) {
                Text(matchUseCase.selectedDate == nil ? Date().toMonthDayString() : matchUseCase.selectedDate!.toMonthDayString())
                    .font(.CustomTitle.customTitle2)
                    .foregroundColor(.gray7)
                
                Text("포스트 시즌")
                    .font(.Head.head4b)
                    .foregroundColor(.gray5)
                    .padding(.bottom, 4)
                
                Spacer(minLength: 0)
            }
            
            Image(systemName: "arrow.counterclockwise.circle.fill")
                .resizable()
                .foregroundColor(.gray4)
                .frame(width: 32, height: 32)
            
            HStack(spacing: 8) {
                Image(systemName: "calendar")
                    .font(.Caption.caption1)
                    .foregroundColor(.gray7)
                
                Text(matchUseCase.selectedDate == nil ? "날짜" : "\(matchUseCase.selectedDate!.toMonthDayString())")
                    .font(.Body.body1)
                    .foregroundColor(.gray7)
                
                Image(systemName: "chevron.down")
                    .font(.Caption.caption1)
                    .foregroundColor(.gray5)
            }
            .padding(.vertical, 12)
            .padding(.leading, 20)
            .padding(.trailing, 14)
            .background(
                RoundedRectangle(cornerRadius: 99)
                    .fill(.white0)
                    .stroke(.gray2, lineWidth: 2)
            )
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    OffSeasonView()
        .environment(PathModel())
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
}
