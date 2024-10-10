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
                    .padding(.leading, 24)
                
                Spacer()
            }
            .padding(.bottom, 48)
            
            TeamInfo(preparingGameInfo: preparingGameInfo)
                .padding(.bottom, 45)
            
            Text("\(preparingGameInfo.startDateTime.toTimeString())")
                .font(.Head.head1)
                .padding(.bottom, 8)
            
            Text("\(preparingGameInfo.place)")
                .font(.Body.body2)
                .padding(.bottom, 56)
            
        }
        .padding(.top, 24)
        .background(Color.gray)
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
                    .frame(width: 72, height: 72)
                
                Text("\(preparingGameInfo.awayTeam.name)")
                    .font(.Head.head2)
            }
            
            Spacer()
            
            Text("VS")
                .font(.Head.head3)
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("\(preparingGameInfo.homeTeam.image)")
                    .frame(width: 72, height: 72)
                
                HStack(spacing: 6) {
                    Text("\(preparingGameInfo.homeTeam.name)")
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

#Preview {
    MyTeamPreParingGameInfo(
        preparingGameInfo: MockDataBuilder.mockMatch
    )
}
