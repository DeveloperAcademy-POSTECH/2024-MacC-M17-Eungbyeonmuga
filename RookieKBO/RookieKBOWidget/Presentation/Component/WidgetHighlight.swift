//
//  WidgetHighlight.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 11/18/24.
//

import SwiftUI

struct WidgetHighlight: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack(spacing: 0) {
            Text("하이라이트 영상을")
                .font(.Body.body1)
                .foregroundColor(.gray1)
                .padding(.bottom, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("즐겨보세요!")
                .font(.Body.body1)
                .foregroundColor(.gray1)
                .padding(.bottom, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("\(teamTypeCharacterString(for: entry.selectedTeamType.selectedTeam))")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                .padding(.bottom, 4)
           
            Text("최근 영상 보러가기")
                .font(.Caption.caption1)
                .foregroundColor(.white0)
                .padding(.vertical, 6)
                .padding(.horizontal, 18)
                .background(.white20)
                .cornerRadius(16)
        }
        .padding(.all, 16)
    }
}
