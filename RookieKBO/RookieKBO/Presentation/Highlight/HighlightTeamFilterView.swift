//
//  HighlightTeamFilterView.swift
//  RookieKBO
//
//  Created by Simmons on 11/21/24.
//

import SwiftUI

struct HighlightTeamFilterView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(HighlightUseCase.self) private var highlightUseCase
    @Environment(\.presentationMode) var presentationMode
    
    @State private var filterColor: Color = .brandPrimary
    @State private var selectedTeam: Team?
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(selectTeamUseCase.state.teams) { team in
                    ScalableButton {
                        selectedTeam = team
                    } label: {
                        HStack(spacing: 4) {
                            Image(uiImage: convertUIImage(for: team.image)!)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .offset(y: -4)
                            Text(team.name.split(separator: " ")[0] == "전체" ? "전체 구단" : team.name.split(separator: " ")[0])
                                .font(.Head.head4b)
                                .foregroundColor(.white0)
                                .frame(width: 88, height: 20)
                        }
                        .frame(width: 172, height: 48)
                        .background(RoundedRectangle(cornerRadius: 99)
                            .fill(Color.teamColor(for: team.color)!.opacity(selectedTeam == team ? 1 : 0.2))
                        )
                    }
                    .padding(.bottom)
                }
            }
            .padding()
            .padding(.top, 32)
            
            Spacer()
            
            if selectedTeam?.name.split(separator: " ")[0] ?? "전체" != highlightUseCase.state.selectedTeamName ?? "전체" {
                ScalableButton {
                    if let teamName = selectedTeam?.name.split(separator: " ")[0] {
                        highlightUseCase.fecthSelectedTeam(String(teamName))
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("이 팀의 하이라이트만 볼래요!")
                        .font(.Head.head3)
                        .frame(width: 361, height: 54)
                        .foregroundColor(.white0)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(selectTeamUseCase.state.selectedTeam?.name == "전체 구단" ?
                                      LinearGradient.gradient(
                                        startColor: .brandPrimary,
                                        endColor: .brandPrimaryGd
                                      ) : LinearGradient.gradient(
                                        startColor: filterColor,
                                        endColor: filterColor
                                      )
                                     )
                        )
                }
            }
        }
        .presentationDragIndicator(.visible)
        .presentationDetents([.height(560)])
        .onAppear {
            filterColor = Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "") ?? .brandPrimary
            selectTeamUseCase.isSheetToggle()
            // 기존 선택된 팀 설정
            if let selectedTeamName = highlightUseCase.state.selectedTeamName {
                selectedTeam = selectTeamUseCase.state.teams.first { $0.name.split(separator: " ")[0] == selectedTeamName }
            } else {
                // 선택된 팀이 없을 경우 전체 구단 활성화
                selectedTeam = selectTeamUseCase.state.teams.first { $0.name.split(separator: " ")[0] == "전체" }
            }
        }
        .onDisappear {
            selectTeamUseCase.isSheetToggle()
        }
    }
}


#Preview {
    HighlightTeamFilterView()
        .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
        .environment(HighlightUseCase(highlightService: HighlightServiceImpl()))
}
