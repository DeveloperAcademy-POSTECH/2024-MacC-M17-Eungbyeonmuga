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
            VStack(spacing: 5) {
                Image("\(preparingGameInfo.awayTeam.image)")
                    .frame(width: 48, height: 48)
                
                Text("\(preparingGameInfo.awayTeam.name)")
                    .font(.Caption.caption1)
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("\(preparingGameInfo.startDateTime.toTimeString())")
                    .font(.Body.body2)
                
                Text("\(preparingGameInfo.place)")
                    .font(.Caption.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Image("\(preparingGameInfo.awayTeam.image)")
                    .frame(width: 48, height: 48)
                
                HStack(spacing: 2) {
                    Text("\(preparingGameInfo.homeTeam.name)")
                        .font(.Caption.caption1)
                    
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
    PreparingGameInfo(preparingGameInfo: Match(
        startDateTime: Date(),
        state: State.PREPARE,
        homeTeam: Team(name: "SSG", image: " "),
        awayTeam: Team(name: "KIA", image: " "),
        place: "인천 ssg랜더스필드",
        scoreBoard: []
    ))
}
