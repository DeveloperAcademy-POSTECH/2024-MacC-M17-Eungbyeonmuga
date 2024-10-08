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
            VStack(spacing: 8) {
                Image("\(cancelGameInfo.awayTeam.image)")
                    .frame(width: 32, height: 32)
                
                Text("\(cancelGameInfo.awayTeam.name)")
                    .font(.Caption.caption2)
            }
            
            Spacer()
            
            Text("우천 취소")
                .font(.Body.body2)
            
            Spacer()
            
            VStack(spacing: 8) {
                Image("\(cancelGameInfo.homeTeam.image)")
                    .frame(width: 32, height: 32)
                
                HStack(spacing: 2) {
                    Text("\(cancelGameInfo.homeTeam.name)")
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
        .padding(.vertical, 16)
        .background(Color.gray)
        .cornerRadius(14)
    }
}

#Preview {
    CancelGameInfo(
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

/*
// 오늘 경기의 취소 경기 표현
CancelGameInfo(cancelGameInfo: matchUseCase.state.CancelGame ?? exampleMatch)
*/
