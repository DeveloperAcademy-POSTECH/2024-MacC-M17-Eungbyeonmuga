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
        WidgetEntry(date: Date(), selectedTeamType: SelectTeamAppIntent())
    }
    
    func snapshot(for configuration: SelectTeamAppIntent, in context: Context) async -> WidgetEntry {
        WidgetEntry(date: Date(), selectedTeamType: configuration)
    }
    
    func timeline(for configuration: SelectTeamAppIntent, in context: Context) async -> Timeline<WidgetEntry> {
        var entries: [WidgetEntry] = []
        
        let selectedTeamType = getSelectTeam()
        let selectedTeamAppIntent = SelectTeamAppIntent.from(selectTeamType: selectedTeamType)
        
        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .second, value: 1, to: currentDate)!
        let entry = WidgetEntry(date: entryDate, selectedTeamType: selectedTeamAppIntent)
        entries.append(entry)
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct WidgetEntry: TimelineEntry {
    let date: Date
    var selectedTeamType: SelectTeamAppIntent
    var match: Match? = MockDataBuilder.mockMatch
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
            case .hanhwaType:
                BackgroundView(image: "img_widgethanhwa")
            case .ktType:
                BackgroundView(image: "img_widgetkt")
            case .ncType:
                BackgroundView(image: "img_widgetnc")
            case .allType:
                if currentMatch == nil {
                    let gradient = LinearGradient.gradient(startColor: Color.Brand.primary, endColor: Color.Brand.primaryGd)
                    
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
                WidgetNoGames(entry: entry)
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
    if let homeTeamColor = entry.match?.homeTeam.color,
       let awayTeamColor = entry.match?.awayTeam.color {
        let homeColor = Color.teamColor(for: homeTeamColor)
        let awayColor = Color.teamColor(for: awayTeamColor)
        
        let gradient = LinearGradient.gradient(startColor: homeColor ?? Color.widget30, endColor: awayColor ?? Color.widget30)
        
        return AnyView(Rectangle().fill(gradient))
    } else {
        return AnyView(EmptyView())
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
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("전체 구단", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var ssgType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .ssgType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("SSG 랜더스", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var lgType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .lgType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("LG 트윈스", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var lotteType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .lotteType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("롯데 자이언츠", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var samsungType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .samsungType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("삼성 라이온즈", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var doosanType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .doosanType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("두산 베어스", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var kiaType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .kiaType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("기아 타이거즈", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var kiwoomType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .kiwoomType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("키움 히어로즈", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var hanhwaType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .hanhwaType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("한화 이글스", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var ktType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .ktType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("KT 위즈", forKey: "selectTeam")
        return intent
    }
    
    fileprivate static var ncType: SelectTeamAppIntent {
        let intent = SelectTeamAppIntent()
        intent.selectedTeam = .ncType
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set("NC 다이노스", forKey: "selectTeam")
        return intent
    }
}

#Preview(as: .systemSmall) {
    RookieKBOWidget()
} timeline: {
    WidgetEntry(date: .now, selectedTeamType: .kiwoomType, match: MockDataBuilder.mockMatch)
}
