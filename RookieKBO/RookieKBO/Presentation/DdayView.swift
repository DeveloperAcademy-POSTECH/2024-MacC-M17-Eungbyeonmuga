//
//  DdayView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/22/24.
//

import SwiftUI

struct DdayView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var currentTeam: Team? { selectTeamUseCase.state.selectedTeam }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("2025 KBO 리그")
                .font(.Body.body1)
                .foregroundColor(.white0)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.teamColor(for: currentTeam?.color ?? ""))
                .cornerRadius(99)
                .padding(.bottom, 20)
            
            Text("개막까지 \(Date.daysLeftToOpeningDate() ?? 0)일 남았어요!")
                .font(.Head.head4b)
                .padding(.bottom, 12)
                .foregroundColor(.gray7)
                .padding(.leading, 16)
            
            Text("루키베이스도 준비중이에요! 함께 기다려요.")
                .font(.Body.body2)
                .padding(.bottom, 14)
                .foregroundColor(.gray7)
                .padding(.leading, 16)
            
            ZStack {
                Image(.dayIcon)
                    
                if let teamImage = teamImage(for: currentTeam?.name ?? "") {
                    Image(uiImage: teamImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                } else {
                    Image("allTeam")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                }
                
            }
            .padding(.leading, 65)
            .padding(.bottom, 12)
            
            DdayProgressView()
                .padding(.bottom, 24)
    
            Text("2025년 3월 22일 개막 예정")
                .font(.Body.body4)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.gray3)
                .cornerRadius(10)
                .padding(.bottom, 24)
                .foregroundColor(.gray7)
                .padding(.leading, 73)
        }
    }
}

private struct DdayProgressView: View {
    let startDate = Date.postSeasonEnd
    let endDate = Date.newSeasonStart
    let currentDate = Date.today
    
    var totalDuration: TimeInterval {
        endDate.timeIntervalSince(startDate)
    }
    
    var remainingDuration: TimeInterval {
        endDate.timeIntervalSince(currentDate)
    }

    var progress: Double {
        return max(0, min(1, (totalDuration - remainingDuration) / totalDuration))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(progress: progress)
                .frame(width: 297, height: 16)
                .cornerRadius(99)
        }
    }
}

struct ProgressBar: View {
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var currentTeam: Team? { selectTeamUseCase.state.selectedTeam }
    
    var progress: Double
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 99)
                .fill(Color.teamColor(for: currentTeam?.color ?? "") ?? .brandPrimary).opacity(0.2)
            
            RoundedRectangle(cornerRadius: 99)
                .fill(Color.teamColor(for: currentTeam?.color ?? "") ?? .brandPrimary)
                .frame(width: CGFloat(progress) * UIScreen.main.bounds.width)
                .animation(.linear(duration: 0.1), value: progress)
        }
    }
}

#Preview {
    DdayView()
        .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
}
