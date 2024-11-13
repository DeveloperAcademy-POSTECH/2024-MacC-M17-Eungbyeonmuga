//
//  MyTeamPreParingGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import SwiftUI

struct MyTeamPreParingGameInfo: View {
    
    let preparingGameInfo: Match
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("오늘 예정된 경기")
                    .font(.Head.head4)
                    .foregroundColor(.gray7)
                    .padding(.leading, 24)
                
                Spacer()
            }
            .padding(.bottom, 48)
            
            TeamInfo(preparingGameInfo: preparingGameInfo)
                .padding(.bottom, 45)
            
            Text("\(preparingGameInfo.startDateTime.toTimeString())")
                .font(.Head.head1)
                .foregroundColor(.gray7)
                .padding(.bottom, 8)
            
            Text("\(preparingGameInfo.place)")
                .font(.Body.body2)
                .foregroundColor(.gray5)
                .padding(.bottom, 56)
            
        }
        .padding(.top, 24)
        .background(.gray2)
        .cornerRadius(14)
    }
}

// MARK: - TeamInfo

private struct TeamInfo: View {
    let preparingGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 16) {
                Image("\(preparingGameInfo.awayTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                Text("\(preparingGameInfo.awayTeam.name.firstWord())")
                    .font(.Head.head2)
                    .foregroundColor(.gray7)
            }
            
            Spacer()
            
            Text("VS")
                .font(.Head.head3)
                .foregroundColor(.gray5)
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("\(preparingGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                HStack(spacing: 6) {
                    Text("\(preparingGameInfo.homeTeam.name.firstWord())")
                        .font(.Head.head2)
                        .foregroundColor(.gray7)
                    
                    Text("홈")
                        .font(.Body.body5)
                        .foregroundColor(.gray7)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(.gray4)
                        .cornerRadius(99)
                }
            }
        }
        .padding(.horizontal, 56)
    }
}

#Preview {
    MyTeamPreParingGameInfo(
        preparingGameInfo: MockDataBuilderForWidget.mockMatch
    )
}
