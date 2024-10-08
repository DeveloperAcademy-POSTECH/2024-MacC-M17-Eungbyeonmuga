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
                    .padding(.leading, 24)
                
                Spacer()
            }
            .padding(.bottom, 25)
            
            TeamInfo(playingGameInfo: playingGameInfo)
                .padding(.bottom, 16)
            
            GameScore(playingGameInfo: playingGameInfo)
                .padding(.bottom, 24)
            
            ScoreBoardView(match: playingGameInfo, inning: .nine)
                .padding(.horizontal, 16)
            
        }
        .padding(.vertical, 24)
        .background(Color.gray)
        .cornerRadius(14)
    }
}

private struct TeamInfo: View {
    let playingGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 16) {
                Image("\(playingGameInfo.awayTeam.image)")
                    .frame(width: 72, height: 72)
                
                Text("\(playingGameInfo.awayTeam.name)")
                    .font(.Head.head2)
            }
            
            Spacer()
            
            Text("VS")
                .font(.Head.head3)
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("\(playingGameInfo.homeTeam.image)")
                    .frame(width: 72, height: 72)
                
                HStack(spacing: 6) {
                    Text("\(playingGameInfo.homeTeam.name)")
                        .font(.Head.head2)
                    
                    Text("홈")
                        .font(.Body.body5)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(Color.yellow)
                        .cornerRadius(99)
                }
            }
        }
        .padding(.horizontal, 56)
    }
}

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
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
            
            Spacer()
            
            Text(inningText)
                .font(.Head.head4)
            
            Spacer()
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle2)
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
        }
        .padding(.horizontal, 48)
    }
}

#Preview {
    MyTeamPlayingGameInfo(
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
