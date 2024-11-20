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
        .background(teamColorGradient(match: endGameInfo))
        .cornerRadius(24)
    }
}

// MARK: - teamColorGradient

private func teamColorGradient(match: Match) -> some View {

    let homeTeamColorString = match.homeTeam.color
    let awayTeamColorString = match.awayTeam.color

    let homeColor = Color.teamColor(for: homeTeamColorString)
    let awayColor = Color.teamColor(for: awayTeamColorString)

    let gradient = LinearGradient.gradient(
        startColor: awayColor ?? Color.brandPrimary,
        endColor: homeColor ?? Color.brandPrimaryGd
    )
    
    return AnyView(Rectangle().fill(gradient))
}

// MARK: - GameInfo

private struct GameInfo: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    let endGameInfo: Match
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                VStack(alignment: .center, spacing: 4) {
                    Image("\(endGameInfo.awayTeam.image)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                    
                    Text("\(endGameInfo.awayTeam.name.firstWord())")
                        .font(.Head.head2b)
                        .foregroundColor(.white0)
                        .frame(width: 76)
                }
                .padding(.leading, 10)
                
                let awayScore = matchUseCase.calculateScore(for: endGameInfo, team: .AWAY)
                
                let homeScore = matchUseCase.calculateScore(for: endGameInfo, team: .HOME)
                
                Text("\(awayScore)")
                    .font(.CustomTitle.customTitle1)
                    .foregroundColor(awayScore < homeScore ? .white40 : .white0)
                    .padding(.leading, 8)
                
                Spacer()
                
                Text("\(homeScore)")
                    .font(.CustomTitle.customTitle1)
                    .foregroundColor(homeScore < awayScore ? .white40 : .white0)
                    .padding(.trailing, 8)
                
                VStack(spacing: 4) {
                    Image("\(endGameInfo.homeTeam.image)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                    
                    HStack(spacing: 8) {
                        Text("\(endGameInfo.homeTeam.name.firstWord())")
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .font(.Head.head2b)
                            .foregroundColor(.white0)
                        
                        Text("홈")
                            .font(.Caption.caption2)
                            .foregroundColor(.gray7)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 2)
                            .background(.white0)
                            .cornerRadius(99)
                    }
                    .frame(width: 76)
                }
                .padding(.trailing, 10)
            }
            
            HStack(spacing: 0) {
                Spacer()
                
                Text("종료")
                    .font(.Body.body2)
                    .foregroundColor(.white0)
                
                Spacer()
            }
        }
    }
}

#Preview {
    EndGameInfo(
        endGameInfo: MockDataBuilderForWidget.mockMatch
    )
    .environment(MatchUseCase(matchService: MatchServiceImpl()))
    .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
    .environment(PreviewHelperForWidget.mockMatchUseCase)
}
