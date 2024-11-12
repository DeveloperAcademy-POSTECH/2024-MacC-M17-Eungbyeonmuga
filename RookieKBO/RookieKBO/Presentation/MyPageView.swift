//
//  MyPageView.swift
//  RookieKBO
//
//  Created by Simmons on 11/7/24.
//

import SwiftUI

struct MyPageView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var body: some View {
        ZStack {
            Color.brandPrimary
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HeaderView()
            }
        }
        .onAppear {
            print(selectTeamUseCase.state.selectedTeam?.image ?? "abc")
        }
    }
}

// MARK: - HeaderView

private struct HeaderView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Text("마이페이지")
                        .font(.CustomTitle.customTitle2)
                        .foregroundColor(.white0)
                }
                .padding(.vertical, 24)
                
                HStack(spacing: 8) {
                    Text("응원팀")
                    Rectangle()
                        .frame(width: 2, height: 16)
                    Image(String(selectTeamUseCase.state.selectedTeam?.image.dropLast(5) ?? "allTeam"))
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text(selectTeamUseCase.state.selectedTeam?.name ?? "전체 구단")
                }
                .font(.Body.body1)
                .foregroundColor(.white0)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(.white0.opacity(0.2)))
            }
            .padding(.horizontal)
            .padding(.bottom, 24)
            
            Spacer()
        }
        
        Spacer()
    }
}

#Preview {
    MyPageView()
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
}
