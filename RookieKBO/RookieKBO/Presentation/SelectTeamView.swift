//
//  SelectTeamView.swift
//  RookieKBO
//
//  Created by Simmons on 10/7/24.
//

import SwiftUI

struct SelectTeamView: View {
    
    @StateObject private var selectTeamUseCase = SelectTeamUseCase()
    @State private var isSelectButtonPresented: Bool = false
    
    var body: some View {
        ZStack {
            Color(Background.first)
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                HeaderView()
                SelectTeamListView(isSelectButtonPresented: $isSelectButtonPresented)
            }
            if isSelectButtonPresented {
                StartTeam()
            }
        }
        .environmentObject(selectTeamUseCase)
    }
}

// MARK: - HeaderView

private struct HeaderView: View {
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 18) {
                // TODO: Image -> Text로 변경
                Image("titleLogo")
                    .resizable()
                    .frame(width: 150, height: 40)
                
                Text("응원하는 구단을 선택하세요!\n우리 팀의 정보를 먼저 확인할 수 있어요.")
                    .font(.Head.head4)
                    .foregroundColor(.TextLabel.main)
            }
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - SelectTeamListView

private struct SelectTeamListView: View {
    
    @EnvironmentObject private var selectTeamUseCase: SelectTeamUseCase
    
    @Binding var isSelectButtonPresented: Bool
    
    @State var selectedTeam: Team?
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(selectTeamUseCase.state.teams) { team in
                    Button {
                        if selectedTeam == team {
                            selectedTeam = nil
                        } else {
                            selectedTeam = team
                        }
                        selectTeamUseCase.toggleSelectedTeam(team)
                        isSelectButtonPresented = selectedTeam != nil
                    } label: {
                        ZStack {
                            // 배경색 변경
                            RoundedRectangle(cornerRadius: 18)
                                .fill(
                                    selectedTeam == nil ? Color.white : (selectedTeam == team ? Color.white : Color.GrayScale.unselectBackground)
                                )
                                .frame(width: 172, height: 150)
                            
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    // 글자 색 구분
                                    let teamNameParts = team.name.split(separator: " ")
                                    
                                    Group{
                                        if teamNameParts[0] == "전체" {
                                            Text(team.name)
                                                .foregroundColor(.TextLabel.main)
                                        } else {
                                            Text(teamNameParts[0])
                                                .foregroundColor(.TextLabel.main)
                                            Text(" " + teamNameParts[1])
                                                .foregroundColor(.TextLabel.sub1)
                                        }
                                    }.font(.Head.head2)
                                    
                                    Spacer()
                                }
                                .padding(.init(top: 12, leading: 20, bottom: 0, trailing: 0))
                                Spacer()
                            }
                            
                            Image(team.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .opacity(selectedTeam == team ? 1 : 0.5)
                                .frame(width: 170, height: 150)
                                .offset(x: 36, y: 16)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .clipped()
                            
                            // 테두리 변경
                            if selectedTeam == team {
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        LinearGradient.primaryGradient,
                                        lineWidth: 5
                                    )
                                    .frame(width: 172, height: 150)
                            } else {
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.GrayScale.stroke, lineWidth: 5)
                                    .frame(width: 172, height: 150)
                            }
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
            .padding(4)
            .padding(.horizontal, 4)
            .padding(.bottom, 80)
        }
    }
}

// MARK: - StartTeam

private struct StartTeam: View {
    
    @EnvironmentObject var selectTeamUseCase: SelectTeamUseCase
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Button {
                // TODO: 선택 팀 저장 & 화면 이동
                print(selectTeamUseCase.state.selectedTeam ?? "선택 안함")
            } label: {
                Text("루키크보 시작하기")
                    .font(.Head.head3)
                    .frame(width: 361, height: 54)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient.primaryGradient))
            }
            .padding()
        }
    }
}

#Preview {
    SelectTeamView()
}
