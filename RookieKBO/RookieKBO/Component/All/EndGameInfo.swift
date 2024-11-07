//
//  EndGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/8/24.
//

import SwiftUI

struct EndGameInfo: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    let endGameInfo: Match
    
    var body: some View {
        VStack(spacing: 20) {
            GameInfo(endGameInfo: endGameInfo)
            ScoreBoardView(match: endGameInfo)
        }
        .padding(.all, 16)
        .background(.gray2)
        .cornerRadius(14)
    }
}

// MARK: - GameInfo

private struct GameInfo: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    let endGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 5) {
                Image("\(endGameInfo.awayTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                Text("\(endGameInfo.awayTeam.name.firstWord())")
                    .font(.Caption.caption1)
            }
            .padding(.trailing, 16)
            .padding(.leading, 8)
            
            let awayScore = matchUseCase.calculateScore(for: endGameInfo, team: .AWAY)
            
            let homeScore = matchUseCase.calculateScore(for: endGameInfo, team: .HOME)
            
            let awayResult = matchUseCase.getAllTeamResult(for: awayScore, otherScore: homeScore)
            
            let homeResult = matchUseCase.getAllTeamResult(for: homeScore, otherScore: awayScore)
            
            Text("\(awayScore)")
                .font(.CustomTitle.customTitle2)
                .foregroundColor(awayResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : .gray5)
                .padding(.vertical, 8)
                .padding(.leading, 12)
                .padding(.trailing, 11)
            
            Text("\(awayResult.description)")
                .font(.Body.body2)
                .foregroundColor(awayResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : .gray5)
                .padding(.leading, 16)
            
            Spacer()
            
            Text("\(homeResult.description)")
                .font(.Body.body2)
                .foregroundColor(homeResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : .gray5)
                .padding(.trailing, 16)
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle2)
                .foregroundColor(homeResult.description == "승" ? Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "primary") : .gray5)
                .padding(.vertical, 8)
                .padding(.leading, 12)
                .padding(.trailing, 11)
            
            VStack(spacing: 5) {
                Image("\(endGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                HStack(spacing: 2) {
                    Text("\(endGameInfo.homeTeam.name.firstWord())")
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .font(.Caption.caption1)
                    
                    Text("홈")
                        .font(.Caption.caption2)
                        .foregroundColor(.gray7)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .background(.gray4)
                        .cornerRadius(99)
                }
            }
            .padding(.trailing, 8)
        }
    }
}

#Preview {
    EndGameInfo(
        endGameInfo: MockDataBuilder.mockMatch
    )
    .environment(MatchUseCase(matchService: MatchServiceImpl()))
    .environment(PreviewHelper.mockMatchUseCase)
}
