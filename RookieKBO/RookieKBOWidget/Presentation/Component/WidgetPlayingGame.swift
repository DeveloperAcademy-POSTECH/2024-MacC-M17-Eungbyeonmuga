//
//  WidgetPlayingGame.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 10/16/24.
//

import WidgetKit
import SwiftUI

struct WidgetPlayingGame: View {
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    let matchUseCase = MatchUseCase(matchService: MatchServiceImpl())
    
    var body: some View {
        VStack(spacing: 0) {
            WidgetGameInfo(entry: entry)
                .padding(.bottom, 14)
            
            let awayScore = matchUseCase.calculateScore(for: currentMatch ?? MockDataBuilder.mockEmptyMatch, team: .AWAY)
            
            let homeScore = matchUseCase.calculateScore(for: currentMatch ?? MockDataBuilder.mockEmptyMatch, team: .HOME)
            
            let inningText = matchUseCase.calculateInningText(for: entry.match ?? MockDataBuilder.mockEmptyMatch)
            
            HStack(spacing: 0) {
                Text("\(awayScore)")
                    .font(.CustomTitle.customTitle1)
                    .foregroundColor(.TextLabel.widget100)
                    .padding(.trailing, 13)
                
                Text("\(inningText)")
                    .font(.Caption.caption1)
                    .foregroundColor(.TextLabel.widget100)
                    .padding(.trailing, 14)
                
                Text("\(homeScore)")
                    .font(.CustomTitle.customTitle1)
                    .foregroundColor(.TextLabel.widget100)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(Color.WidgetBackground.widgetHomeBg)
            .cornerRadius(14)
        }
    }
}
