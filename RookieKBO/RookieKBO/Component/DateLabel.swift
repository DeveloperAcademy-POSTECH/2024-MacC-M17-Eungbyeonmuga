//
//  DateLabel.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/19/24.
//

import SwiftUI

struct DateLabel: View {
    
    let date: Date
    let isAllTeam: Bool = UserDefaults.shared.string(forKey: "selectTeam") == "전체 구단"

    var body: some View {
        Text("\(date.toMonthDayString())")
            .font(.Body.body2)
            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
            .foregroundStyle(isAllTeam ? Color.white : .TextLabel.main)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(isAllTeam ? Color.Brand.primary : .Background.second)
            }
    }
}

#Preview {
    DateLabel(date: Date())
}
