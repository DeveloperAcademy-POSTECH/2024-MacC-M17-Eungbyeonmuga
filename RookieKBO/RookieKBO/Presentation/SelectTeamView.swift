//
//  SelectTeamView.swift
//  RookieKBO
//
//  Created by Simmons on 10/7/24.
//

import SwiftUI

struct SelectTeamView: View {
    var body: some View {
        HeaderView()
        SelectTeamListView()
    }
}

// MARK: - HeaderView

private struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("루키크보")
                    .font(.CustomTitle.customTitle1)
                
                Text("응원하는 구단을 선택하세요!\n우리 팀의 정보를 먼저 확인할 수 있어요.")
                    .font(.Body.body1)
                    .lineSpacing(12)
            }
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - SelectTeamListView

private struct SelectTeamListView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let teams: [Team] = [
        Team(name: "SSG 랜더스", image: "팀1"),
        Team(name: "KIA 타이거즈", image: "팀2"),
        Team(name: "KT 위즈", image: "팀3"),
        Team(name: "LG 트윈스", image: "팀4"),
        Team(name: "NC 다이노스", image: "팀5"),
        Team(name: "두산 베어스", image: "팀6"),
        Team(name: "롯데 자이언츠", image: "팀7"),
        Team(name: "삼성 라이온즈", image: "팀8"),
        Team(name: "키움 히어로즈", image: "팀9"),
        Team(name: "한화 이글즈", image: "팀10"),
        Team(name: "전체 구단", image: "팀11")
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(teams) { team in
                    Button {
                        print("\(team) 번째 팀")
                    } label: {
                        ZStack{
                            VStack {
                                HStack{
                                    Text(team.name)
                                    Spacer()
                                }
                                .padding(.init(top: 8, leading: 32, bottom: 0, trailing: 0))
                                Spacer()
                            }
                            
                            Image(systemName:"pencil.circle.fill") // TODO: team.image로 변경
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .padding(.init(top: 30, leading: 50, bottom: 0, trailing: 0))
                        }
                        .frame(width: 172, height: 172)
                        .clipped()
                        .background(RoundedRectangle(cornerRadius: 18)
                            .fill(Color.white)
                            .stroke(.gray, lineWidth: 5))
                        
                        
                    }
                    .padding(8)
                }
            }
            .padding(8)
        }
    }
}

#Preview {
    SelectTeamView()
}
