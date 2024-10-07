//
//  PreparingGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import SwiftUI

struct PreparingGameInfo: View {
    
    let preparingGameInfo: Match
    
    var body: some View {
        
        HStack(spacing: 0) {
            VStack(spacing: 8) {
                Image("\(preparingGameInfo.awayTeam.image)")
                    .frame(width: 32, height: 32)
                
                Text("\(preparingGameInfo.awayTeam.name)")
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("\(preparingGameInfo.startDateTime.toTimeString())")
                
                Text("\(preparingGameInfo.place)")
            }
            
            Spacer()
            
            VStack(spacing: 2) {
                Image("\(preparingGameInfo.awayTeam.image)")
                    .frame(width: 32, height: 32)
                
                HStack(spacing: 2) {
                    Text("\(preparingGameInfo.homeTeam.name)")
                    
                    Text("홈")
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
        // TODO: 색깔 수정
        .background(Color.gray)
        .cornerRadius(14)
    }
}

#Preview {
    PreparingGameInfo(preparingGameInfo: Match(
        startDateTime: Date(),
        state: State.PREPARE,
        homeTeam: Team(name: "SSG", image: " "),
        awayTeam: Team(name: "KIA", image: " "),
        place: "인천 ssg랜더스필드",
        scoreBoard: []
    ))
}

/*
// 오늘 경기의 예정 경기 표현
CancelGameInfo(preparingGameInfo: matchUseCase.state.PreparingGame ?? exampleMatch)
*/

