//
//  TeamRankRow.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import SwiftUI

struct TeamRankRow: View {
    
    let teamRank: TeamRank
    
    var body: some View {
        HStack(spacing: 0) {
            TeamInfo(teamRank: teamRank)
            Spacer()
            TeamRankInfo(teamRank: teamRank)
        }
    }
}

private struct TeamInfo: View {
    
    let teamRank: TeamRank
    
    var body: some View {
        HStack(spacing: 0) {
            Image("\(String.teamImage(for: teamRank.team) ?? "allTeamImage")")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                .padding(.trailing, 10)
            
            Text("\(teamRank.rank)")
                .font(.Head.head5)
                .foregroundColor(.white60)
                .padding(.trailing, 10)
            
            Text("\(teamRank.team)")
                .font(.Head.head5)
                .foregroundColor(.white0)
                .frame(width: 36)
        }
        .padding(.vertical, 4)
        .padding(.leading, 12)
        .padding(.trailing, 20)
        .background(Color.teamColor(for: teamRank.team))
        .cornerRadius(16)
    }
}

private struct TeamRankInfo: View {
    
    let teamRank: TeamRank
    
    var body: some View {
        HStack(spacing: 11) {
            Text("\(teamRank.wins)")
                .font(.Body.body1)
                .foregroundColor(.gray7)
                .frame(width: 24)
            
            Text("\(teamRank.draws)")
                .font(.Body.body1)
                .foregroundColor(.gray7)
                .frame(width: 24)
            
            Text("\(teamRank.losses)")
                .font(.Body.body1)
                .foregroundColor(.gray7)
                .frame(width: 24)
            
            Text("\(teamRank.winRate)")
                .font(.Body.body1)
                .foregroundColor(.gray7)
                .frame(width: 52)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.gray2)
        .cornerRadius(16)
    }
}

#Preview {
    TeamRankRow(teamRank: MockDataBuilder.mockTeamRank)
}
