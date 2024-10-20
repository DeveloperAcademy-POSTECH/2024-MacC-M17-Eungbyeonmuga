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
        .background(Color.Background.second)
        .cornerRadius(14)
    }
}

// MARK: - GameInfo

private struct GameInfo: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    let endGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 5) {
                Image("\(endGameInfo.awayTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
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
                .font(.CustomTitle.customTitle1)
                .foregroundColor(awayResult.color)
                .padding(.vertical, 8)
                .padding(.leading, 12)
                .padding(.trailing, 11)
            
            Text("\(awayResult.description)")
                .font(.Body.body2)
                .foregroundColor(awayResult.color)
                .padding(.leading, 16)
            
            Spacer()
            
            Text("\(homeResult.description)")
                .font(.Body.body2)
                .foregroundColor(homeResult.color)
                .padding(.trailing, 16)
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle1)
                .foregroundColor(homeResult.color)
                .padding(.vertical, 8)
                .padding(.leading, 12)
                .padding(.trailing, 11)
            
            VStack(spacing: 5) {
                Image("\(endGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                HStack(spacing: 2) {
                    Text("\(endGameInfo.homeTeam.name.firstWord())")
                        .font(.Caption.caption1)
                    
                    Text("홈")
                        .font(.Caption.caption2)
                        .foregroundColor(.TextLabel.main)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .background(Color.ScoreBoardColor.homeBg)
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
