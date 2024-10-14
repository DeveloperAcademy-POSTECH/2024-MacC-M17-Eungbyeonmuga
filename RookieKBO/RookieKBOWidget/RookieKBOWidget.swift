//
//  RookieKBOWidget.swift
//  RookieKBOWidget
//
//  Created by crownjoe on 10/11/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), selectedTeam: SelectTeamAppIntent())
    }
    
    func snapshot(for configuration: SelectTeamAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), selectedTeam: configuration)
    }
    
    func timeline(for configuration: SelectTeamAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, selectedTeam: configuration)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let selectedTeam: SelectTeamAppIntent
    var match: Match?
    
}

struct RookieKBOWidgetEntryView : View {
    
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    var body: some View {
        ZStack {
            Image(.imgWidgetssg)
                .resizable()
                .scaledToFill()
                .containerBackground(for: .widget) {
                    NoGamesView()
                }
            
            if currentMatch?.gameState == .CANCEL.self {
                CancelGameView(entry: entry)
            }
            
            else if currentMatch?.gameState == .END.self {
                EndGameView(entry: entry)
            }
            
            else if currentMatch?.gameState == .PLAYING.self {
                PlayingGameView(entry: entry)
            }
            
            else if currentMatch?.gameState == .PREPARE {
                PreParingGameView(entry: entry)
            }
            else {
                NoGamesView()
            }
        }
    }
}

// MARK: - GameInfoView

private struct GameInfoView: View {
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    var body: some View {
        HStack(spacing: 14) {
            VStack(spacing: 8) {
                Image("\(currentMatch?.awayTeam.image ?? "")")
                    .frame(width: 40, height: 40)
                
                Text("\(currentMatch?.awayTeam.name.firstWord() ??  "")")
                    .font(.Caption.caption1)
            }
            
            Text("VS")
                .font(.Caption.caption2)
            
            VStack(spacing: 8) {
                Image("\(currentMatch?.homeTeam.image ?? "")")
                    .frame(width: 40, height: 40)
                
                HStack(spacing: 2) {
                    Text("\(currentMatch?.homeTeam.name.firstWord() ??  "")")
                        .font(.Caption.caption1)
                    
                    Text("홈")
                        .font(.Caption.caption2)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .background(Color.yellow)
                        .cornerRadius(99)
                }
            }
        }
    }
}

// MARK: - PlayingGameView

private struct PlayingGameView: View {
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    var body: some View {
        GameInfoView(entry: entry)
            .padding(.bottom, 14)
        
        // TODO: nil 값 처리
        let awayScore = calculateScore(for: currentMatch ?? MockDataBuilder.mockMatch, team: .AWAY)
        
        let homeScore = calculateScore(for: currentMatch ?? MockDataBuilder.mockMatch, team: .HOME)
        
        let inningText = calculateInningText(for: entry.match ?? MockDataBuilder.mockMatch)
        
        HStack(spacing: 0) {
            Text("\(awayScore)")
                .font(.CustomTitle.customTitle1)
                .padding(.trailing, 13)
            
            Text("\(inningText)")
                .font(.Caption.caption1)
                .padding(.trailing, 14)
            
            Text("\(homeScore)")
                .font(.CustomTitle.customTitle1)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.pink)
        .cornerRadius(14)
    }
}

// MARK: - PreParingGameView

private struct PreParingGameView: View {
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    var body: some View {
        GameInfoView(entry: entry)
            .padding(.bottom, 14)
        
        if let startDateTime = currentMatch?.startDateTime, Calendar.current.isDate(startDateTime, inSameDayAs: Date.today) {
            
            Text("\(currentMatch?.startDateTime.toTimeString() ?? "")")
                .font(.Body.body2)
                .padding(.bottom, 4)
            
            Text("\(currentMatch?.place ?? "")")
                .font(.Caption.caption2)
            
        } else {
            Text("\(currentMatch?.startDateTime.formattedString() ?? "")")
                .font(.Body.body2)
                .padding(.bottom, 4)
            
            Text("\(currentMatch?.place ?? "")")
                .font(.Caption.caption2)
        }
    }
}

// MARK: - EndGameView

private struct EndGameView: View {
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    var body: some View {
        VStack(spacing: 0) {
            GameInfoView(entry: entry)
                .padding(.bottom, 14)
            
            // TODO: nil 값 처리
            let awayScore = calculateScore(for: currentMatch ?? MockDataBuilder.mockMatch, team: .AWAY)
            
            let homeScore = calculateScore(for: currentMatch ?? MockDataBuilder.mockMatch, team: .HOME)
            
            let awayResult = getResult(for: awayScore, otherScore: homeScore)
            
            let homeResult = getResult(for: homeScore, otherScore: awayScore)
            
            HStack(spacing: 0) {
                Text("\(awayScore)")
                    .font(.CustomTitle.customTitle1)
                    .padding(.trailing, 11)
                
                Text("\(awayResult)")
                    .font(.Body.body2)
                    .padding(.trailing, 10)
                
                Text("\(homeResult)")
                    .font(.Body.body2)
                    .padding(.trailing, 12)
                
                Text("\(homeScore)")
                    .font(.CustomTitle.customTitle1)
            }
        }
    }
}

// MARK: - CancelGameView

private struct CancelGameView: View {
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    var body: some View {
        VStack(spacing: 0) {
            GameInfoView(entry: entry)
                .padding(.bottom, 14)
            
            Text("우천 취소")
                .font(.Body.body2)
                .padding(.bottom, 4)
            
            Text("\(currentMatch?.place ?? "")")
                .font(.Caption.caption2)
        }
    }
}

// MARK: - NoGamesView

private struct NoGamesView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            // TODO: 이미지 처리
            Circle()
                .frame(width: 55, height: 55)
                .padding(.bottom, 15)
            
            Text("예정된 경기가 \n없어요!")
                .font(.Body.body1)
                .multilineTextAlignment(.center)
        }
    }
}


struct RookieKBOWidget: Widget {
    let kind: String = "choseyeon.RookieKBO.RookieKBOWidget"
    
    var body: some WidgetConfiguration {
        
        AppIntentConfiguration(kind: kind, intent: SelectTeamAppIntent.self, provider: Provider()) { entry in
            RookieKBOWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("루키크보 위젯⚾️")
        .description("루키크보 위젯입니다.")
        .supportedFamilies([.systemSmall])
        .contentMarginsDisabled()
    }
}

extension SelectTeamAppIntent {
    
    fileprivate static var allType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .allType
        return intent
    }
    
    fileprivate static var ssgType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .ssgType
        return intent
    }
    
    fileprivate static var lgType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .lgType
        return intent
    }
    
    fileprivate static var lotteType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .lotteType
        return intent
    }
    
    fileprivate static var samsungType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .samsungType
        return intent
    }
    
    fileprivate static var doosanType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .doosanType
        return intent
    }
    
    fileprivate static var kiaType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .kiaType
        return intent
    }
    
    fileprivate static var kiwoomType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .kiwoomType
        return intent
    }
    
    fileprivate static var hanhwaType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .hanhwaType
        return intent
    }
    
    fileprivate static var ktType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .ktType
        return intent
    }
    
    fileprivate static var ncType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .ncType
        return intent
    }
}

#Preview(as: .systemSmall) {
    RookieKBOWidget()
} timeline: {
    SimpleEntry(date: .now, selectedTeam: .ssgType, match: nil
    )
}
