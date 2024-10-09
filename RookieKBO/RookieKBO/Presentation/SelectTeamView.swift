//
//  SelectTeamView.swift
//  RookieKBO
//
//  Created by Simmons on 10/7/24.
//

import SwiftUI

struct SelectTeamView: View {
    
    @EnvironmentObject private var selectTeamUseCase: SelectTeamUseCase
    
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
    }
}

// MARK: - HeaderView

private struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 18) {
                Image("TitleLogo")
                    .resizable()
                    .frame(width: 150, height: 40)
//                Text("루키크보")
//                    .font(.CustomTitle.customTitle1)
                
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
                        print("\(team) 번째 팀")
                        if selectTeamUseCase.selectedTeam == team {
                            selectTeamUseCase.isSelectButtonPresented.toggle()
                        } else {
                            selectTeamUseCase.isSelectButtonPresented = true
                            selectTeamUseCase.selectedTeam = team
                        }
                    } label: {
                        ZStack{
                            VStack {
                                HStack{
                                    Text(team.name)
                                    Spacer()
                                }
                                .padding(.init(top: 16, leading: 32, bottom: 0, trailing: 0))
                                Spacer()
                            }
                            
                            Image(team.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 170, height: 150)
                                .offset(x: 36, y: 10)
                                .clipped()
                            
                            RoundedRectangle(cornerRadius: 18)
                                .fill(.clear)
                                .stroke(.gray, lineWidth: 5)
                                .frame(width: 172, height: 150)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding(8)
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
                print(selectTeamUseCase.selectedTeam ?? "선택 안함")
            } label: {
                Text("루키크보 시작하기")
                    .frame(width: 361, height: 54)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 16)
                        .fill(.gray))
            }
        }
    }
}

#Preview {
    SelectTeamView()
        .environmentObject(SelectTeamUseCase())
}
