//
//  WidgetEndGame.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 10/16/24.
//

import WidgetKit
import SwiftUI


//struct WidgetEndGame: View {
//    var entry: Provider.Entry
//    var currentMatch: Match? { entry.match }
//    
//    let matchUseCase = MatchUseCase(matchService: MatchServiceImpl())
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            WidgetGameInfo(entry: entry)
//                .padding(.bottom, 14)
//            
//            let awayScore = matchUseCase.calculateScore(for: currentMatch ?? MockDataBuilderForWidget.mockEmptyMatch, team: .AWAY)
//            
//            let homeScore = matchUseCase.calculateScore(for: currentMatch ?? MockDataBuilderForWidget.mockEmptyMatch, team: .HOME)
//            
//            let awayResult = getResult(for: awayScore, otherScore: homeScore)
//            
//            let homeResult = getResult(for: homeScore, otherScore: awayScore)
//            
//            HStack(spacing: 0) {
//                Text("\(awayScore)")
//                    .font(.CustomTitle.customTitle1)
//                    .foregroundColor(awayResult.color)
//                    .padding(.trailing, 11)
//                
//                Text("\(awayResult.description)")
//                    .font(.Body.body2)
//                    .foregroundColor(awayResult.color)
//                    .padding(.trailing, 10)
//                
//                Text("\(homeResult.description)")
//                    .font(.Body.body2)
//                    .foregroundColor(homeResult.color)
//                    .padding(.trailing, 12)
//                
//                Text("\(homeScore)")
//                    .font(.CustomTitle.customTitle1)
//                    .foregroundColor(homeResult.color)
//            }
//        }
//    }
//}
