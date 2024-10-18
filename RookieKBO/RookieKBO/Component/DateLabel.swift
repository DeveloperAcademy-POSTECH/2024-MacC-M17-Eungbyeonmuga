//
//  DateLabel.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/19/24.
//

import SwiftUI

struct DateLabel: View {
    
    let date: Date

    var body: some View {
        Text("\(date.toMonthDayString())")
            .font(.Body.body2)
            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
            .foregroundStyle(Color.white)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Brand.primary)
            }
    }
}

#Preview {
    DateLabel(date: Date())
}
