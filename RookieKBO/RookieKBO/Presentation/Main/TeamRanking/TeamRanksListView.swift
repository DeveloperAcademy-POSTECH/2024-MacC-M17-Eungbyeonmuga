//
//  TeamRanksListView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/14/24.
//

import SwiftUI

struct TeamRanksListView: View {
    @Environment(RankUseCase.self) private var rankUseCase
    
    var body: some View {
        VStack(spacing: 0) {
            
            if rankUseCase.ranks.isEmpty {
                Spacer()
                
                ProgressView()
                    .tint(.brandPrimary)
                
                Spacer()
            } else {
                RankInfo()
                    .padding(.bottom, 16)
                
                ForEach(rankUseCase.ranks) { rank in
                    TeamRankRow(teamRank: rank)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                }
            }
        }
        .onAppear {
            Task {
                await rankUseCase.fetchRanks()
            }
        }
        .presentationDetents([.fraction(0.985)])
        .presentationDragIndicator(.visible)
    }
}

private struct RankInfo: View {
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                Text("순위")
                    .font(.CustomTitle.customTitle2)
                    .foregroundColor(.gray7)
                    .padding(.leading, 16)
                
                Spacer()
                
                Text("2024 KBO 리그")
                    .font(.Body.body1)
                    .foregroundColor(.white0)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color.brandPrimary)
                    .cornerRadius(99)
                    .padding(.trailing, 16)
            }
            .padding(.bottom, 24)
            
            HStack(spacing: 0) {
                
                Spacer()
                
                Text("승")
                    .font(.Body.body1)
                    .foregroundColor(.gray5)
                    .frame(width: 24)
                    .padding(.trailing, 11)
                
                Text("무")
                    .font(.Body.body1)
                    .foregroundColor(.gray5)
                    .frame(width: 24)
                    .padding(.trailing, 11)
                
                Text("패")
                    .font(.Body.body1)
                    .foregroundColor(.gray5)
                    .frame(width: 24)
                    .padding(.trailing, 11)
                
                Text("승률")
                    .font(.Body.body1)
                    .foregroundColor(.gray5)
                    .frame(width: 52)
                    .padding(.trailing, 36)
            }
        }
    }
}

#Preview {
    TeamRanksListView()
        .environment(RankUseCase(rankService: RankServiceImpl()))
}
