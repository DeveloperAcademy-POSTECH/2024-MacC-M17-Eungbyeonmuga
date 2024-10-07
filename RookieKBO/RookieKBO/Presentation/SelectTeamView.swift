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

#Preview {
    SelectTeamView()
}
