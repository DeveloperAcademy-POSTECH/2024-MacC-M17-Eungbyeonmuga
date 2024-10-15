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
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                Text("\(preparingGameInfo.awayTeam.name.firstWord())")
                    .font(.Caption.caption1)
                    .foregroundColor(.TextLabel.main)
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("\(preparingGameInfo.startDateTime.toTimeString())")
                    .font(.Body.body2)
                    .foregroundColor(.TextLabel.main)
                
                Text("\(preparingGameInfo.place)")
                    .font(.Caption.caption2)
                    .foregroundColor(.TextLabel.scoreBoard)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Image("\(preparingGameInfo.awayTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                HStack(spacing: 2) {
                    Text("\(preparingGameInfo.homeTeam.name.firstWord())")
                        .font(.Caption.caption1)
                        .foregroundColor(.TextLabel.main)
                    
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
        .background(Color.ScoreBoardColor.scoreBoardBg)
        .cornerRadius(14)
    }
}

#Preview {
    PreparingGameInfo(preparingGameInfo: MockDataBuilder.mockMatch)
}
