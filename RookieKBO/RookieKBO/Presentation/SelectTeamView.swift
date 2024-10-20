//
//  SelectTeamView.swift
//  RookieKBO
//
//  Created by Simmons on 10/7/24.
//

import SwiftUI
import WidgetKit

struct SelectTeamView: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @State private var isSelectButtonPresented: Bool = false
    
    @State private var selectedTeam: Team?
    
    var body: some View {
        ZStack {
            Color(Background.first)
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                HeaderView()
                SelectTeamListView(isSelectButtonPresented: $isSelectButtonPresented, selectedTeam: $selectedTeam)
            }
            if isSelectButtonPresented {
                StartTeam(selectedTeam: $selectedTeam)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - HeaderView

private struct HeaderView: View {
    
    let currentSelectTeam = UserDefaults.shared.string(forKey: "selectTeam") ?? "없음"
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                if currentSelectTeam == "없음" {
                    Image("titleLogo")
                        .resizable()
                        .frame(width: 150, height: 40)
                        .padding(.bottom, 18)
                    
                    Text("응원하는 구단을 선택하세요!")
                        .font(.Head.head4)
                        .foregroundColor(.TextLabel.main)
                        .padding(.bottom, 8)
                    
                    Text("우리 팀의 정보를 먼저 확인할 수 있어요.")
                        .font(.Head.head4)
                        .foregroundColor(.TextLabel.main)
                    
                } else {
                    Group {
                        if currentSelectTeam == "전체 구단" {
                            
                            Text("지금 '\(currentSelectTeam)'을 응원하고 계시네요!")
                                .font(.Head.head4)
                                .foregroundColor(.TextLabel.main)
                                .padding(.bottom, 8)
                            
                            Text("응원 팀을 변경할 수도 있어요.")
                                .font(.Head.head4)
                                .foregroundColor(.TextLabel.main)
                        } else {
                            Text("지금 '\(currentSelectTeam)'을 응원하고 계시네요!")
                                .font(.Head.head4)
                                .foregroundColor(.TextLabel.main)
                                .padding(.bottom, 8)
                            
                            Text("응원 팀을 변경할 수도 있어요.")
                                .font(.Head.head4)
                                .foregroundColor(.TextLabel.main)
                        }
                    }
                    .font(.Head.head4)
                    .foregroundColor(.TextLabel.main)
                    .lineSpacing(8)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - SelectTeamListView

private struct SelectTeamListView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    @Binding var isSelectButtonPresented: Bool
    
    @Binding var selectedTeam: Team?
    
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
//                        selectTeamUseCase.toggleSelectedTeam(team)
                        // TODO: 추후 삭제 예정 (LOG)
                        print("응원팀 버튼 클릭 : \(selectedTeam)")
                        isSelectButtonPresented = selectedTeam != nil
                    } label: {
                        ZStack {
                            // 배경색 변경
                            RoundedRectangle(cornerRadius: 18)
                                .fill(
                                    selectedTeam == nil ? Color.white : (selectedTeam == team ? Color.white : Color.TeamSelect.unselectBg)
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
                                                .foregroundColor(.TextLabel.scoreBoard)
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
                                        LinearGradient.gradient(startColor: .Brand.primary, endColor: .Brand.primaryGd),
                                        lineWidth: 5
                                    )
                                    .frame(width: 172, height: 150)
                            } else {
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.TeamSelect.stroke, lineWidth: 5)
                                    .frame(width: 172, height: 150)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 80)
        }
    }
}

// MARK: - StartTeam

private struct StartTeam: View {
    
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Binding var selectedTeam: Team?
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Button {
                selectTeamUseCase.updateUserDefaultsTeam()
                if let selectedTeam = selectedTeam {
                    selectTeamUseCase.updateUserDefaultsTeamObject(selectedTeam)
                    selectTeamUseCase.fetchSelectedTeam(selectedTeam)
                    print("UserDefaults Select team: \(selectTeamUseCase.getUserDefaultsTeamObject()!)")
                }
                WidgetCenter.shared.reloadAllTimelines()
//                pathModel.pop()
//                if selectTeamUseCase.state.selectedTeam?.name != "전체 구단" {
//                    pathModel.push(.myTeamGameInfo)
//                } else {
//                    pathModel.push(.allGameInfo)
//                }
                
            } label: {
                Text("루키크보 시작하기")
                    .font(.Head.head3)
                    .frame(width: 361, height: 54)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient.gradient(startColor: .Brand.primary, endColor: .Brand.primaryGd)))
            }
            .padding()
        }
    }
}

#Preview {
    SelectTeamView()
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}
