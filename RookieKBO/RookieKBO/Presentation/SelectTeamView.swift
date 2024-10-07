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
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(0..<11) { index in // TODO: 0..<11 대신 팀으로 변경
                    Button {
                        print("\(index) 번째 팀")
                    } label: {
                        RoundedRectangle(cornerRadius: 16) // TODO: 팀 이미지, 팀 명으로 변경
                            .frame(width: .infinity, height: 172)
                            .foregroundColor(.gray)
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
