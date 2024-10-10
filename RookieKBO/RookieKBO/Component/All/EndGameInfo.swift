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
        .background(Color.gray)
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
                    .frame(width: 48, height: 48)
                
                Text("\(endGameInfo.awayTeam.name)")
                    .font(.Caption.caption1)
            }
            .padding(.trailing, 16)
            
            let awayScore = matchUseCase.calculateScore(for: endGameInfo, team: .AWAY)
            
            let homeScore = matchUseCase.calculateScore(for: endGameInfo, team: .HOME)
            
            let awayResult = matchUseCase.getResult(for: awayScore, otherScore: homeScore)
            
            let homeResult = matchUseCase.getResult(for: homeScore, otherScore: awayScore)
            
            Text("\(awayScore)")
                .font(.CustomTitle.customTitle2)
                .padding(.vertical, 8)
                .padding(.leading, 12)
                .padding(.trailing, 11)
            
            Text("\(awayResult)")
                .font(.Body.body2)
                .padding(.leading, 16)
            
            Spacer()
            
            Text("\(homeResult)")
                .font(.Body.body2)
                .padding(.trailing, 16)
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle2)
                .padding(.vertical, 8)
                .padding(.leading, 12)
                .padding(.trailing, 11)
            
            VStack(spacing: 5) {
                Image("\(endGameInfo.homeTeam.image)")
                    .frame(width: 48, height: 48)
                
                HStack(spacing: 2) {
                    Text("\(endGameInfo.homeTeam.name)")
                        .font(.Caption.caption1)
                    
                    Text("홈")
                        .font(.Caption.caption2)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .background(Color.yellow)
                        .cornerRadius(99)
                }
            }
        }
    }
}

#Preview {
    EndGameInfo(
        endGameInfo: MockDataBuilder.mockMatch
    )
    .environment(PreviewHelper.mockMatchUseCase)
}
