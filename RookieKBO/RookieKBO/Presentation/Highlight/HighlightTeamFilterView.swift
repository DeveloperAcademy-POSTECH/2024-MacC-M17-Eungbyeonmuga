//
//  HighlightTeamFilterView.swift
//  RookieKBO
//
//  Created by Simmons on 11/21/24.
//

import SwiftUI

struct HighlightTeamFilterView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
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
            .padding(.horizontal)
        }
        .onAppear {
            selectedTeam = selectTeamUseCase.state.selectedTeam
        }
    }
}


#Preview {
    HighlightTeamFilterView()
        .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
}
