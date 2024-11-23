//
//  HighlightTeamFilterView.swift
//  RookieKBO
//
//  Created by Simmons on 11/21/24.
//

import SwiftUI

struct HighlightTeamFilterView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    @State private var filterColor: Color = .brandPrimary
    @State private var selectedTeam: Team?
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(selectTeamUseCase.state.teams) { team in
                    Button {
                        selectedTeam = team
                    } label: {
                        HStack(spacing: 4) {
                            Image(uiImage: convertUIImage(for: team.image)!)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .offset(y: -4)
                            Text(team.name.split(separator: " ")[0])
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
            
            if selectedTeam?.name != selectTeamUseCase.state.selectedTeam?.name {
                Button {
                    // TODO: 해당 팀의 하이라이트만 표시
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
            selectedTeam = selectTeamUseCase.state.selectedTeam
        }
    }
}


#Preview {
    HighlightTeamFilterView()
        .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
}
