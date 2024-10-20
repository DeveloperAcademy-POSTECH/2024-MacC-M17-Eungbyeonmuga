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
                    .foregroundColor(.TextLabel.main)
                    .padding(.leading, 24)
                
                Spacer()
                
                Text("\(endGameInfo.season)")
                    .font(.Body.body2)
                    .foregroundColor(.TextLabel.scoreBoard)
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
        .background(Color.Background.second)
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
                
                Text("\(endGameInfo.awayTeam.name.firstWord())")
                    .font(.Head.head2)
                    .foregroundColor(.TextLabel.main)
            }
            
            Spacer()
            
            Text("VS")
                .font(.Head.head3)
                .foregroundColor(.TextLabel.scoreBoard)
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("\(endGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                
                HStack(spacing: 6) {
                    Text("\(endGameInfo.homeTeam.name.firstWord())")
                        .font(.Head.head2)
                        .foregroundColor(.TextLabel.main)
                    
                    Text("홈")
                        .font(.Body.body5)
                        .foregroundColor(.TextLabel.main)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(Color.ScoreBoardColor.homeBg)
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
                .foregroundColor(awayResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : Color.TextLabel.scoreBoard)
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
            
            Text("\(awayResult.description)")
                .font(.Head.head4)
                .foregroundColor(awayResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : Color.TextLabel.scoreBoard)
                .padding(.leading, 16)
            
            Spacer()
            
            Text("\(homeResult.description)")
                .font(.Head.head4)
                .foregroundColor(homeResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : Color.TextLabel.scoreBoard)
                .padding(.trailing, 16)
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle1).foregroundColor(homeResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : Color.TextLabel.scoreBoard)
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
        }
        .padding(.horizontal, 48)
    }
}

#Preview {
    MyTeamEndGameInfo(
        endGameInfo: MockDataBuilder.mockMatch
    )
    .environment(PreviewHelper.mockMatchUseCase)
//    .environment(PreviewHelper.mockSelectTeamUseCase)
}
