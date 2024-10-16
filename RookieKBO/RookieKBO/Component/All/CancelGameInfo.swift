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
                    .frame(width: 48, height: 48)
                
                Text("\(cancelGameInfo.awayTeam.name.firstWord())")
                    .font(.Caption.caption1)
                    .foregroundColor(.TextLabel.main)
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("우천 취소")
                    .font(.Body.body2)
                    .foregroundColor(.TextLabel.main)
                
                Text("\(cancelGameInfo.place)")
                    .font(.Caption.caption2)
                    .foregroundColor(.TextLabel.scoreBoard)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Image("\(cancelGameInfo.homeTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                HStack(spacing: 2) {
                    Text("\(cancelGameInfo.homeTeam.name.firstWord())")
                        .foregroundColor(.TextLabel.main)
                        .font(.Caption.caption1)
                    
                    Text("홈")
                        .font(.Caption.caption3)
                        .foregroundColor(.TextLabel.main)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .background(Color.ScoreBoardColor.homeBg)
                        .cornerRadius(99)
                }
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 16)
        .background(Color.Background.second)
        .cornerRadius(14)
    }
}

#Preview {
    CancelGameInfo(
        cancelGameInfo: MockDataBuilder.mockMatch
    )
}
