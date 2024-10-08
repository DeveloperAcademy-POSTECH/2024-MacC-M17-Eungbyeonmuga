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
                    .padding(.leading, 24)
                
                Spacer()
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
        .background(Color.gray)
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
                    .frame(width: 72, height: 72)
                
                Text("\(endGameInfo.awayTeam.name)")
                    .font(.Head.head2)
            }
            
            Spacer()
            
            Text("VS")
                .font(.Head.head3)
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("\(endGameInfo.homeTeam.image)")
                    .frame(width: 72, height: 72)
                
                HStack(spacing: 6) {
                    Text("\(endGameInfo.homeTeam.name)")
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
    
    let endGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            let awayScore = matchUseCase.calculateScore(for: endGameInfo, team: .AWAY)
            
            let homeScore = matchUseCase.calculateScore(for: endGameInfo, team: .HOME)
            
            let awayResult = matchUseCase.getResult(for: awayScore, otherScore: homeScore)
            
            let homeResult = matchUseCase.getResult(for: homeScore, otherScore: awayScore)
            
            Text("\(awayScore)")
                .font(.CustomTitle.customTitle1)
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
            
            Text("\(awayResult)")
                .font(.Head.head4)
                .padding(.leading, 16)
            
            Spacer()
            
            Text("\(homeResult)")
                .font(.Head.head4)
                .padding(.trailing, 16)
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle1)
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
        }
        .padding(.horizontal, 48)
    }
}

#Preview {
    MyTeamEndGameInfo(
        endGameInfo: Match(
            startDateTime: Date(),
            state: State.CANCEL,
            homeTeam: Team(name: "SSG", image: " "),
            awayTeam: Team(name: "KIA", image: " "),
            place: "인천 ssg랜더스필드",
            scoreBoard: [
                ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 2, 1]),
                ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 1, 0, 0])
            ]
        )
    )
    .environment(PreviewHelper.mockMatchUseCase)
}
