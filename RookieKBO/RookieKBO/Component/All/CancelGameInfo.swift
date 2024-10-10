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
                    .frame(width: 48, height: 48)
                
                Text("\(cancelGameInfo.awayTeam.name)")
                    .font(.Caption.caption1)
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("우천 취소")
                    .font(.Body.body2)
                
                Text("\(cancelGameInfo.place)")
                    .font(.Caption.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Image("\(cancelGameInfo.homeTeam.image)")
                    .frame(width: 48, height: 48)
                
                HStack(spacing: 2) {
                    Text("\(cancelGameInfo.homeTeam.name)")
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
    CancelGameInfo(
        cancelGameInfo: MockDataBuilder.mockMatch
    )
}
