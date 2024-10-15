//
//  PlayingGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import SwiftUI

struct PlayingGameInfo: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    let playingGameInfo: Match
    
    var body: some View {
        VStack(spacing: 20) {
            GameInfo(playingGameInfo: playingGameInfo)
            ScoreBoardView(match: playingGameInfo)
        }
        .padding(.all, 16)
        .background(Color.ScoreBoardColor.scoreBoardBg)
        .cornerRadius(14)
    }
}

// MARK: - GameInfo

private struct GameInfo: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    let playingGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 5) {
                Image("\(playingGameInfo.awayTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                Text("\(playingGameInfo.awayTeam.name.firstWord())")
                    .foregroundColor(.TextLabel.main)
                    .font(.Caption.caption1)
            }
            .padding(.trailing, 16)
            
            let awayScore = matchUseCase.calculateScore(for: playingGameInfo, team: .AWAY)
            
            let homeScore = matchUseCase.calculateScore(for: playingGameInfo, team: .HOME)
            
            let inningText = matchUseCase.calculateInningText(for: playingGameInfo)
            
            Text("\(awayScore)")
                .font(.CustomTitle.customTitle2)
                .foregroundColor(.TextLabel.main)
                .padding(.vertical, 8)
                .padding(.horizontal, 7)
            
            Spacer()
            
            Text(inningText)
                .font(.Body.body2)
                .foregroundColor(.TextLabel.main)
            
            Spacer()
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle2)
                .foregroundColor(.TextLabel.main)
                .padding(.vertical, 8)
                .padding(.horizontal, 7)
                .padding(.trailing, 16)
            
            VStack(spacing: 5) {
                Image("\(playingGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                HStack(spacing: 2) {
                    Text("\(playingGameInfo.homeTeam.name.firstWord())")
                        .font(.Caption.caption1)
                        .foregroundColor(.TextLabel.main)
                    
                    Text("홈")
                        .font(.Caption.caption2)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .background(Color.ScoreBoardColor.homeBg)
                        .cornerRadius(99)
                }
            }
        }
    }
}

#Preview {
    PlayingGameInfo(
        playingGameInfo: MockDataBuilder.mockMatch
    )
    .environment(PreviewHelper.mockMatchUseCase)
}
