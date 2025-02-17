//
//  DateLabel.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/19/24.
//

import SwiftUI

struct DateLabel: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    let date: Date
    var isAllTeam: Bool {
        selectTeamUseCase.state.selectedTeam?.name == "전체 구단"
    }

    var body: some View {
        Text("\(date.toMonthDayString())")
            .font(.Body.body2)
            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
            .foregroundStyle(isAllTeam ? Color.white : .gray7)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(isAllTeam ? .brandPrimary : Color.gray2)
            }
    }
}

#Preview {
    DateLabel(date: Date())
}
