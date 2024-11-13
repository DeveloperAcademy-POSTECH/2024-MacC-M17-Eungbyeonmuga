//
//  MyTeamEndGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/8/24.
//

import SwiftUI

struct MyTeamEndGameInfo: View {
    
    let endGameInfo: Match
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("오늘 종료된 경기")
                    .font(.Head.head4)
                    .foregroundColor(.gray7)
                    .padding(.leading, 24)
                
                Spacer()
                
                Text("\(endGameInfo.season)")
                    .font(.Body.body2)
                    .foregroundColor(.gray5)
                    .padding(.trailing, 24)
                
            }
            .padding(.bottom, 48)
            
            TeamInfo(endGameInfo: endGameInfo)
                .padding(.bottom, 16)
            
            GameScore(endGameInfo: endGameInfo)
                .padding(.bottom, 24)
            
            ScoreBoardView(match: endGameInfo)
                .padding(.horizontal, 16)
            
        }
        .padding(.vertical, 24)
        .background(.gray2)
        .cornerRadius(14)
    }
}

// MARK: - TeamInfo

private struct TeamInfo: View {
    let endGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 16) {
                Image("\(endGameInfo.awayTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                Text("\(endGameInfo.awayTeam.name.firstWord())")
                    .font(.Head.head2)
                    .foregroundColor(.gray7)
            }
            
            Spacer()
            
            Text("VS")
                .font(.Head.head3)
                .foregroundColor(.gray5)
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("\(endGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                HStack(spacing: 6) {
                    Text("\(endGameInfo.homeTeam.name.firstWord())")
                        .font(.Head.head2)
                        .foregroundColor(.gray7)
                    
                    Text("홈")
                        .font(.Body.body5)
                        .foregroundColor(.gray7)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(.gray4)
                        .cornerRadius(99)
                }
            }
        }
        .padding(.horizontal, 56)
    }
}

private struct GameScore: View {
    @Environment(MatchUseCase.self) private var matchUseCase
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    let endGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            let awayScore = matchUseCase.calculateScore(for: endGameInfo, team: .AWAY)
            
            let homeScore = matchUseCase.calculateScore(for: endGameInfo, team: .HOME)
            
            let awayResult = matchUseCase.getMyTeamResult(for: awayScore, otherScore: homeScore)
            
            let homeResult = matchUseCase.getMyTeamResult(for: homeScore, otherScore: awayScore)
            
            Text("\(awayScore)")
                .font(.CustomTitle.customTitle1)
                .foregroundColor(awayResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : .gray5)
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
            
            Text("\(awayResult.description)")
                .font(.Head.head4)
                .foregroundColor(awayResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : .gray5)
                .padding(.leading, 16)
            
            Spacer()
            
            Text("\(homeResult.description)")
                .font(.Head.head4)
                .foregroundColor(homeResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : .gray5)
                .padding(.trailing, 16)
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle1).foregroundColor(homeResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : .gray5)
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
        }
        .padding(.horizontal, 48)
    }
}

#Preview {
    MyTeamEndGameInfo(
        endGameInfo: MockDataBuilderForWidget.mockMatch
    )
    .environment(PreviewHelperForWidget.mockMatchUseCase)
//    .environment(PreviewHelper.mockSelectTeamUseCase)
}
