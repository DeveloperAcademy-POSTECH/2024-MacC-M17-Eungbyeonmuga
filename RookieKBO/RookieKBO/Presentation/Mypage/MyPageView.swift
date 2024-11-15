//
//  MyPageView.swift
//  RookieKBO
//
//  Created by Simmons on 11/7/24.
//

import SwiftUI

struct MyPageView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(PathModel.self) private var pathModel
    
    var body: some View {
        ZStack {
            Color(Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "") ?? .brandPrimary)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HeaderView()
                SettingView()
                    .background(.gray1)
            }
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
                .padding(.vertical)
                
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
    }
}

// MARK: - SettingView

private struct SettingView: View {
    
    @Environment(PathModel.self) private var pathModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            Button {
                pathModel.push(.savedTerms)
            } label: {
                HStack(spacing: 0) {
                    Image(.saveWord)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(28)
                        .padding(.trailing, -8)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("저장된 야구 용어")
                            .font(.Head.head2b)
                            .foregroundColor(.gray7)
                        
                        Text("저장했던 용어를 다시 확인해보세요!")
                            .font(.Body.body4)
                            .foregroundStyle(.gray7)
                    }
                    
                    Spacer()
                }
                .frame(width: 361, height: 106)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.black8.opacity(0.05))
                            .blur(radius: 10)
                        
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.white0)
                    }
                )
                .padding()
                .padding(.vertical, 8)
            }
            
            Button {
                pathModel.push(.selectTeam)
            } label: {
                HStack(spacing: 0) {
                    Image(.changeTeam)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(28)
                        .padding(.trailing, -8)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("응원팀 변경")
                            .font(.Head.head2b)
                            .foregroundColor(.gray7)
                        
                        Text("응원하는 팀을 바꿀 수 있어요!")
                            .font(.Body.body4)
                            .foregroundStyle(.gray7)
                    }
                    
                    Spacer()
                }
                .frame(width: 361, height: 106)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.black8.opacity(0.05))
                            .blur(radius: 10)
                        
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.white0)
                    }
                )
                .padding(.horizontal)
            }
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width)
        }
    }
}

#Preview {
    MyPageView()
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
        .environment(PathModel())
}
