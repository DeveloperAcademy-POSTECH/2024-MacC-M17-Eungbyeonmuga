//
//  CancelGameInfo.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import SwiftUI

struct CancelGameInfo: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    private var cancelGameInfo: Match {
        matchUseCase.state.CancelGame ?? Match(
            startDateTime: Date(),
            state: State.CANCEL,
            homeTeam: Team(name: "SSG", image: " "),
            awayTeam: Team(name: "KIA", image: " "),
            place: "인천 ssg랜더스필드",
            scoreBoard: []
        )
    }
    
    
    var body: some View {
        
        HStack(spacing: 0) {
            VStack(spacing: 8) {
                Image("\(cancelGameInfo.awayTeam.image)")
                    .frame(width: 32, height: 32)
                
                Text("\(cancelGameInfo.awayTeam.name)")
            }
            
            Spacer()
            
            Text("우천 취소")
            
            Spacer()
            
            VStack(spacing: 8) {
                Image("\(cancelGameInfo.awayTeam.image)")
                    .frame(width: 32, height: 32)
                
                HStack(spacing: 2) {
                    Text("\(cancelGameInfo.homeTeam.name)")
                    
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
    CancelGameInfo()
        .environment(PreviewHelper.mockMatchUseCase)
}
