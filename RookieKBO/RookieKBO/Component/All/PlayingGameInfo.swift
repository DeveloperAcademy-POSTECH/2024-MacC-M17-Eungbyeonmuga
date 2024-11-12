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
        .background(.gray2)
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
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                Text("\(playingGameInfo.awayTeam.name.firstWord())")
                    .foregroundColor(.gray7)
                    .font(.Caption.caption1)
            }
            .padding(.trailing, 16)
            .padding(.leading, 8)
            
            let awayScore = matchUseCase.calculateScore(for: playingGameInfo, team: .AWAY)
            
            let homeScore = matchUseCase.calculateScore(for: playingGameInfo, team: .HOME)
            
            let inningText = matchUseCase.calculateInningText(for: playingGameInfo)
            
            Text("\(awayScore)")
                .font(.CustomTitle.customTitle2)
                .foregroundColor(.gray7)
                .padding(.vertical, 8)
                .padding(.horizontal, 7)
            
            Spacer()
            
            Text(inningText)
                .font(.Body.body2)
                .foregroundColor(.gray7)
            
            Spacer()
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle2)
                .foregroundColor(.gray7)
                .padding(.vertical, 8)
                .padding(.horizontal, 7)
                .padding(.trailing, 16)
            
            VStack(spacing: 5) {
                Image("\(playingGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                HStack(spacing: 2) {
                    Text("\(playingGameInfo.homeTeam.name.firstWord())")
                        .font(.Caption.caption1)
                        .foregroundColor(.gray7)
                    
                    Text("홈")
                        .font(.Caption.caption2)
                        .foregroundStyle(.black)
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
    PlayingGameInfo(
        playingGameInfo: MockDataBuilder.mockMatch
    )
    .environment(PreviewHelperForWidget.mockMatchUseCase)
}
