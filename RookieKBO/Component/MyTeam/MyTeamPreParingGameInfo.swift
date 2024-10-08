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
                .padding(.horizontal, 56)
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
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("\(preparingGameInfo.homeTeam.image)")
                    .frame(width: 72, height: 72)
                
                HStack(spacing: 2) {
                    Text("\(preparingGameInfo.homeTeam.name)")
                        .font(.Head.head2)
                    
                    Text("홈")
                        .font(.Body.body5)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 2)
                        .background(Color.yellow)
                        .cornerRadius(99)
                }
            }
        }
    }
}

#Preview {
    MyTeamPreParingGameInfo(
        preparingGameInfo: Match(
            startDateTime: Date(),
            state: State.PREPARE,
            homeTeam: Team(name: "SSG", image: " "),
            awayTeam: Team(name: "KIA", image: " "),
            place: "인천 ssg랜더스필드",
            scoreBoard: []
        )
    )
}
