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
        WidgetEntry(date: Date(), selectedTeamType: .allType)
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
}

struct RookieKBOWidgetEntryView : View {
    
    var entry: Provider.Entry
    
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
                BackgroundView(image: "img_widgetall")
            }
            
            WidgetHighlight(entry: entry)
            
        }
        .widgetURL(URL(string: "rookiekbo://highlight"))
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

struct RookieKBOWidget: Widget {
    
    // TODO: 각자 위젯 아이디로 변경
    let kind: String = "com.rookiekbo.widget"
    
    var body: some WidgetConfiguration {
        
        AppIntentConfiguration(kind: kind, intent: SelectTeamAppIntent.self, provider: Provider()) { entry in
            RookieKBOWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("루키크보 위젯")
        .description("곧 다가올 경기 일정부터 하이라이트까지, \n응원 팀의 정보를 한눈에 확인하세요!")
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
    WidgetEntry(date: .now, selectedTeamType: .allType)
}
