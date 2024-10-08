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
            ScoreBoardView(match: playingGameInfo, inning: .nine)
        }
        .padding(.all, 16)
        .background(Color.gray)
        .cornerRadius(14)
    }
}

private struct GameInfo: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    let playingGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 8) {
                Image("\(playingGameInfo.awayTeam.image)")
                    .frame(width: 32, height: 32)
                
                Text("\(playingGameInfo.awayTeam.name)")
                    .font(.Caption.caption2)
            }
            .padding(.trailing, 16)
            
            let awayScore = matchUseCase.calculateScore(for: playingGameInfo, team: .AWAY)
            
            Text("\(awayScore)")
                .font(.CustomTitle.customTitle2)
                .padding(.vertical, 8)
                .padding(.horizontal, 7)
            
            Spacer()
            
            let inningText = matchUseCase.calculateInningText(for: playingGameInfo)
            
            Text(inningText)
                .font(.Body.body2)
            
            Spacer()
            
            let homeScore = matchUseCase.calculateScore(for: playingGameInfo, team: .HOME)
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle2)
                .padding(.vertical, 8)
                .padding(.horizontal, 7)
                .padding(.trailing, 16)
            
            VStack(spacing: 8) {
                Image("\(playingGameInfo.homeTeam.image)")
                    .frame(width: 32, height: 32)
                
                HStack(spacing: 2) {
                    Text("\(playingGameInfo.homeTeam.name)")
                        .font(.Caption.caption2)
                    
                    Text("홈")
                        .font(.Caption.caption3)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .background(Color.yellow)
                        .cornerRadius(99)
                }
            }
        }
        .padding(.horizontal, 32)
    }
}


#Preview {
    PlayingGameInfo(
        playingGameInfo: Match(
            startDateTime: Date(),
            state: State.CANCEL,
            homeTeam: Team(name: "SSG", image: " "),
            awayTeam: Team(name: "KIA", image: " "),
            place: "인천 ssg랜더스필드",
            scoreBoard: [
                ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1]),
                ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0])
            ]
        )
    )
    .environment(PreviewHelper.mockMatchUseCase)
}
