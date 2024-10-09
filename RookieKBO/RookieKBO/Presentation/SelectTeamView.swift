//
//  SelectTeamView.swift
//  RookieKBO
//
//  Created by Simmons on 10/7/24.
//

import SwiftUI

struct SelectTeamView: View {
    
    @StateObject private var selectTeamUseCase = SelectTeamUseCase()
    
    var body: some View {
        ZStack{
            VStack{
                HeaderView()
                SelectTeamListView()
            }
            if selectTeamUseCase.isSelectButtonPresented {
                StartTeam()
            }
        }
        .environmentObject(selectTeamUseCase)
    }
}

// MARK: - HeaderView

private struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 18) {
                Image("TitleLogo") // TODO: Image -> Text로 변경
                    .resizable()
                    .frame(width: 150, height: 40)
                
                Text("응원하는 구단을 선택하세요!\n우리 팀의 정보를 먼저 확인할 수 있어요.")
                    .font(.Head.head4)
            }
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - SelectTeamListView

private struct SelectTeamListView: View {
    
    @EnvironmentObject private var selectTeamUseCase: SelectTeamUseCase
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(selectTeamUseCase.teams) { team in
                    Button {
                        if selectTeamUseCase.selectedTeam == team {
                            selectTeamUseCase.isSelectButtonPresented.toggle()
                            selectTeamUseCase.selectedTeam = nil
                        } else {
                            selectTeamUseCase.isSelectButtonPresented = true
                            selectTeamUseCase.selectedTeam = team
                        }
                    } label: {
                        ZStack{
                            // 배경색 변경
                            RoundedRectangle(cornerRadius: 18)
                                .fill(
                                    selectTeamUseCase.selectedTeam == nil ? Color.white : (selectTeamUseCase.selectedTeam! == team ? Color.white : Color.selectTeamBackground)
                                )
                                .frame(width: 172, height: 150)
                            
                            VStack {
                                HStack{
                                    // 글자 색 구분
                                    let teamNameParts = team.name.split(separator: " ")
                                    
                                    Group{
                                        if teamNameParts[0] == "전체" {
                                            Text(team.name)
                                                .foregroundColor(.black)
                                        } else {
                                            Text(teamNameParts[0])
                                                .foregroundColor(.black)
                                            Text(teamNameParts[1])
                                                .foregroundColor(.black.opacity(0.5))
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
                                .opacity(selectTeamUseCase.selectedTeam == team ? 1 : 0.5)
                                .frame(width: 170, height: 150)
                                .offset(x: 36, y: 16)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .clipped()
                            
                            // 테두리 변경
                            if selectTeamUseCase.selectedTeam == team {
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        LinearGradient.primaryGradient,
                                        lineWidth: 5
                                    )
                                    .frame(width: 172, height: 150)
                            } else {
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.selectTeamStroke, lineWidth: 5)
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
        VStack {
            Spacer()
            Button {
                print(selectTeamUseCase.selectedTeam ?? "선택 안함") // TODO: 선택 팀 저장 & 화면 이동
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

extension LinearGradient {
    static var primaryGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color.primaryColor1, location: 0.0),
                .init(color: Color.primaryColor2, location: 1.0)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

#Preview {
    SelectTeamView()
}
