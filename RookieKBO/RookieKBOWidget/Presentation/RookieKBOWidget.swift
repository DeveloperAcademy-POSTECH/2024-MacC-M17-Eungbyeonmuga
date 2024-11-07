//
//  RookieKBOWidget.swift
//  RookieKBOWidget
//
//  Created by crownjoe on 10/11/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date(), selectedTeamType: .allType, match: MockDataBuilder.mockMatch)
    }
    
    func snapshot(for configuration: SelectTeamAppIntent, in context: Context) async -> WidgetEntry {
        WidgetEntry(date: Date(), selectedTeamType: configuration, match: MockDataBuilder.mockMatch)
    }
    
    func timeline(for configuration: SelectTeamAppIntent, in context: Context) async -> Timeline<WidgetEntry> {
        var entries: [WidgetEntry] = []
        
        let selectedTeamType = getSelectTeam()
        let selectedTeamAppIntent = SelectTeamAppIntent.from(selectTeamType: selectedTeamType)
        
        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .second, value: 1, to: currentDate)!
//        let todayMatch = await filterMatches()
        let entry = WidgetEntry(date: entryDate, selectedTeamType: selectedTeamAppIntent, match: filterMatches(matches: MockDataBuilder.mockMatchList))
        entries.append(entry)
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct WidgetEntry: TimelineEntry {
    let date: Date
    var selectedTeamType: SelectTeamAppIntent
    var match: Match?
}

struct RookieKBOWidgetEntryView : View {
    
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    var body: some View {
        ZStack {
            switch entry.selectedTeamType.selectedTeam {
            case .ssgType:
                BackgroundView(image: "img_widgetssg")
            case .lgType:
                BackgroundView(image: "img_widgetlg")
            case .lotteType:
                BackgroundView(image: "img_widgetlotte")
            case .samsungType:
                BackgroundView(image: "img_widgetsamsung")
            case .doosanType:
                BackgroundView(image: "img_widgetdoosan")
            case .kiaType:
                BackgroundView(image: "img_widgetkia")
            case .kiwoomType:
                BackgroundView(image: "img_widgetkiwoom")
            case .hanwhaType:
                BackgroundView(image: "img_widgethanwha")
            case .ktType:
                BackgroundView(image: "img_widgetkt")
            case .ncType:
                BackgroundView(image: "img_widgetnc")
            case .allType:
                if currentMatch == nil {
                    let gradient = LinearGradient.gradient(startColor: .brandPrimary, endColor: .brandPrimaryGd)
                    
                    AnyView(Rectangle().fill(gradient))
                } else {
                    allTypeBackgroundView(entry: entry)
                }
            }
            
            if currentMatch?.gameState == .CANCEL.self {
                WidgetCancelGame(entry: entry)
            }
            
            else if currentMatch?.gameState == .END.self {
                WidgetEndGame(entry: entry)
            }
            
            else if currentMatch?.gameState == .PLAYING.self {
                WidgetPlayingGame(entry: entry)
            }
            
            else if currentMatch?.gameState == .PREPARE {
                WidgetPreparingGame(entry: entry)
            }
            else {
                WidgetNoGame(entry: entry)
            }
        }
    }
}

// MARK: - BackgroundView

private func BackgroundView(image: String) -> some View {
    Image("\(image)")
        .resizable()
        .scaledToFill()
        .containerBackground(for: .widget) {
        }
}

// MARK: - allTypeBackgroundView

private func allTypeBackgroundView(entry: Provider.Entry) -> some View {

    let defaultColorString = "primary"
    let homeTeamColorString = entry.match?.homeTeam.color ?? defaultColorString
    let awayTeamColorString = entry.match?.awayTeam.color ?? defaultColorString

    let homeColor = Color.teamColor(for: homeTeamColorString)
    let awayColor = Color.teamColor(for: awayTeamColorString)

    let gradient = LinearGradient.gradient(
        startColor: awayColor ?? Color.widget30,
        endColor: homeColor ?? Color.widget30
    )
    
    return AnyView(Rectangle().fill(gradient))
}


struct RookieKBOWidget: Widget {
    
    // TODO: 각자 위젯 아이디로 변경
    let kind: String = "com.rookiekbo.simmons.widget"
    
    var body: some WidgetConfiguration {
        
        AppIntentConfiguration(kind: kind, intent: SelectTeamAppIntent.self, provider: Provider()) { entry in
            RookieKBOWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("루키크보 위젯")
        .description("곧 다가올 경기 일정부터 실시간 경기 정보까지, \n응원 팀의 정보를 한눈에 확인하세요!")
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
    
    fileprivate static var hanwhaType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .hanwhaType
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
    WidgetEntry(date: .now, selectedTeamType: .allType, match: MockDataBuilder.mockMatch)
}
