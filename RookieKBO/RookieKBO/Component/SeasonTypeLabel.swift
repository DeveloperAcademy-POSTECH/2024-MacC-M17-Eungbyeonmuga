//
//  SeasonTypeLabel.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/18/24.
//

import SwiftUI

struct SeasonTypeLabel: View {
    
    enum SeasonType: String {
        case regular = "정규 시즌"
        case post = "포스트 시즌"
    }
    
    let seasonType: SeasonType

    var body: some View {
        Text(seasonType.rawValue)
            .font(.Body.body2)
            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
            .foregroundStyle(.gray6)
    }
}

#Preview {
    SeasonTypeLabel(seasonType: SeasonTypeLabel.SeasonType.regular)
}
