//
//  MyTeamCancelGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import SwiftUI

struct MyTeamCancelGameInfo: View {
    let cancelGameInfo: Match
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                Text("오늘 취소된 경기")
                    .padding(.leading, 24)
                
                Spacer()
            }
            .padding(.bottom, 48)
            
            TeamInfo(cancelGameInfo: cancelGameInfo)
                .padding(.horizontal, 56)
                .padding(.bottom, 45)
            
            Text("우천 취소")
                .padding(.bottom, 8)
            
            Text("\(cancelGameInfo.place)")
                .padding(.bottom, 56)
            
        }
        .padding(.top, 24)
        .background(Color.gray)
        .cornerRadius(14)
    }
}

private struct TeamInfo: View {
    let cancelGameInfo: Match
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 16) {
                Image("\(cancelGameInfo.awayTeam.image)")
                    .frame(width: 72, height: 72)
                
                Text("\(cancelGameInfo.awayTeam.name)")
            }
            
            Spacer()
            
            Text("VS")
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("\(cancelGameInfo.homeTeam.image)")
                    .frame(width: 72, height: 72)
                
                HStack(spacing: 2) {
                    Text("\(cancelGameInfo.homeTeam.name)")
                    
                    Text("홈")
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
    MyTeamCancelGameInfo(
        cancelGameInfo: Match(
            startDateTime: Date(),
            state: State.CANCEL,
            homeTeam: Team(name: "SSG", image: " "),
            awayTeam: Team(name: "KIA", image: " "),
            place: "인천 ssg랜더스필드",
            scoreBoard: []
        )
    )
}

