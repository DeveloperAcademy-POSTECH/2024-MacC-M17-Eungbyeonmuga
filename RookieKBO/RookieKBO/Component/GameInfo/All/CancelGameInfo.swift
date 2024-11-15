//
//  CancelGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import SwiftUI

struct CancelGameInfo: View {
    
    let cancelGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 5) {
                Image("\(cancelGameInfo.awayTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                Text("\(cancelGameInfo.awayTeam.name.firstWord())")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(.Head.head2b)
                    .foregroundColor(.white0)
            }
            
            Spacer()
            
            VStack(spacing: 8) {
                Text("경기가")
                    .font(.Body.body2)
                    .foregroundColor(.white0)
                
                Text("취소되었어요")
                    .font(.Body.body2)
                    .foregroundColor(.white0)
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Image("\(cancelGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                HStack(spacing: 8) {
                    Text("\(cancelGameInfo.homeTeam.name.firstWord())")
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
            }
        }
        .padding(.horizontal, 21)
        .padding(.top, 16)
        .padding(.bottom, 24)
        .background(teamColorGradient(match: cancelGameInfo))
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


#Preview {
    CancelGameInfo(
        cancelGameInfo: MockDataBuilderForWidget.mockMatch
    )
}
