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
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                Text("\(preparingGameInfo.awayTeam.name.firstWord())")
                    .font(.Caption.caption1)
                    .foregroundColor(.gray7)
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("\(preparingGameInfo.startDateTime.toTimeString())")
                    .font(.Body.body2)
                    .foregroundColor(.gray7)
                
                Text("\(preparingGameInfo.place)")
                    .font(.Caption.caption2)
                    .foregroundColor(.gray5)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Image("\(preparingGameInfo.awayTeam.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                
                HStack(spacing: 2) {
                    Text("\(preparingGameInfo.homeTeam.name.firstWord())")
                        .font(.Caption.caption1)
                        .foregroundColor(.gray7)
                    
                    Text("홈")
                        .font(.Caption.caption3)
                        .foregroundColor(.gray7)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .background(.gray4)
                        .cornerRadius(99)
                }
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 16)
        .background(.gray2)
        .cornerRadius(14)
    }
}

#Preview {
    PreparingGameInfo(preparingGameInfo: MockDataBuilder.mockMatch)
}
