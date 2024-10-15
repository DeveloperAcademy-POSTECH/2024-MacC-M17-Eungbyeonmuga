//
//  WidgetGameInfoView.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 10/16/24.
//

import WidgetKit
import SwiftUI


struct WidgetGameInfo: View {
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    var body: some View {
        HStack(spacing: 14) {
            VStack(spacing: 8) {
                Image("\(teamCharacterString(for: currentMatch?.awayTeam ?? Team(name: "", image: "", color: "")))")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                Text("\(currentMatch?.awayTeam.name.firstWord() ??  "")")
                    .font(.Caption.caption1)
                    .foregroundColor(.TextLabel.widget100)
            }
            
            Text("VS")
                .font(.Caption.caption2)
                .foregroundColor(.TextLabel.widget50)
            
            VStack(spacing: 8) {
                Image("\(teamCharacterString(for: currentMatch?.homeTeam ?? Team(name: "", image: "", color: "")))")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                HStack(spacing: 2) {
                    Text("\(currentMatch?.homeTeam.name.firstWord() ??  "")")
                        .font(.Caption.caption1)
                        .foregroundColor(.TextLabel.widget100)
                    
                    Text("홈")
                        .font(.Caption.caption2)
                        .foregroundColor(.TextLabel.widget100)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .background(entry.selectedTeamType.selectedTeam == .allType ? Color.WidgetBackground.widgetScoreBoardBg : Color.teamColor(for: colorString(for: entry.selectedTeamType.selectedTeam)))
                        .cornerRadius(99)
                }
            }
        }
    }
}
