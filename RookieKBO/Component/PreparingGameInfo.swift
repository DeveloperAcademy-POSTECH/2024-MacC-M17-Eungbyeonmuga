//
//  PreparingGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import SwiftUI

struct PreparingGameInfo: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    private var preparingGameInfo: Match {
        matchUseCase.state.PreparingGame ?? Match(
            startDateTime: Date(),
            state: State.PREPARE,
            homeTeam: Team(name: "SSG", image: " "),
            awayTeam: Team(name: "KIA", image: " "),
            place: "인천 ssg랜더스필드",
            scoreBoard: []
        )
    }
    
    
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
            
            VStack(spacing: 8) {
                Image("\(preparingGameInfo.awayTeam.image)")
                    .frame(width: 32, height: 32)
                
                Text("\(preparingGameInfo.homeTeam.name)")
            }
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    PreparingGameInfo()
        .environment(PreviewHelper.mockMatchUseCase)
}
