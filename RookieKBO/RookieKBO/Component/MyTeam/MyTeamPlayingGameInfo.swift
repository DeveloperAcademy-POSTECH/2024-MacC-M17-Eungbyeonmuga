//
//  MyTeamPlayingGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/8/24.
//

import SwiftUI

struct MyTeamPlayingGameInfo: View {
    
    let playingGameInfo: Match
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("오늘 진행 중인 경기")
                    .font(.Head.head4)
                    .foregroundColor(.TextLabel.main)
                    .padding(.leading, 24)
                
                Spacer()
            }
            .padding(.bottom, 25)
            
            TeamInfo(playingGameInfo: playingGameInfo)
                .padding(.bottom, 16)
            
            GameScore(playingGameInfo: playingGameInfo)
                .padding(.bottom, 24)
            
            ScoreBoardView(match: playingGameInfo)
                .padding(.horizontal, 16)
            
        }
        .padding(.vertical, 24)
        .background(Color.Background.second)
        .cornerRadius(14)
    }
}

// MARK: - TeamInfo

private struct TeamInfo: View {
    let playingGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 16) {
                Image("\(playingGameInfo.awayTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                Text("\(playingGameInfo.awayTeam.name.firstWord())")
                    .font(.Head.head2)
                    .foregroundColor(.TextLabel.main)
            }
            
            Spacer()
            
            Text("VS")
                .font(.Head.head3)
                .foregroundColor(.TextLabel.scoreBoard)
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("\(playingGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                HStack(spacing: 6) {
                    Text("\(playingGameInfo.homeTeam.name.firstWord())")
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

// MARK: - GameScore

private struct GameScore: View {
    @Environment(MatchUseCase.self) private var matchUseCase
    
    let playingGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            let awayScore = matchUseCase.calculateScore(for: playingGameInfo, team: .AWAY)
            
            let homeScore = matchUseCase.calculateScore(for: playingGameInfo, team: .HOME)
            
            let inningText = matchUseCase.calculateInningText(for: playingGameInfo)
            
            Text("\(awayScore)")
                .font(.CustomTitle.customTitle2)
                .foregroundColor(.TextLabel.main)
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
            
            Spacer()
            
            Text(inningText)
                .font(.Head.head4)
                .foregroundColor(.TextLabel.main)
            
            Spacer()
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle2)
                .foregroundColor(.TextLabel.main)
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
        }
        .padding(.horizontal, 48)
    }
}

#Preview {
    MyTeamPlayingGameInfo(
        playingGameInfo: MockDataBuilder.mockMatch
    )
    .environment(PreviewHelper.mockMatchUseCase)
}
