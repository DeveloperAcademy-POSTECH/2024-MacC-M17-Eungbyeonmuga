//
//  WidgetNoGames.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 10/16/24.
//

import WidgetKit
import SwiftUI


struct WidgetNoGames: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image("\(teamTypeCharacterString(for: entry.selectedTeamType.selectedTeam))")
                .resizable()
                .scaledToFit()
                .frame(width: 55, height: 55)
                .padding(.bottom, 15)
            
            Text("예정된 경기가 \n없어요!")
                .font(.Body.body1)
                .foregroundColor(.TextLabel.widget100)
                .multilineTextAlignment(.center)
        }
    }
}
