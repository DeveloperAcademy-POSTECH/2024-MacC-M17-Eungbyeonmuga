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
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct RookieKBOWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        
        VStack(spacing: 0) {
            HStack(spacing: 14) {
                VStack(spacing: 8) {
                    Circle()
                        .frame(width: 40, height: 40)
                    
                    Text("SSG")
                        .font(.Caption.caption2)
                        
                }
                
                Text("VS")
                    .font(.Caption.caption2)
                
                VStack(spacing: 8) {
                    Circle()
                        .frame(width: 40, height: 40)
                    
                    Text("KIA")
                        .font(.Caption.caption2)
                }
            }
            .padding(.bottom, 14)
            
            Text("18:00")
                .font(.Body.body2)
                .padding(.bottom, 4)
            
            Text("인천 SSG랜더스 필드")
                .font(.Caption.caption2)
            
        }
        
//        VStack {
//            Text("Time:")
//            Text(entry.date, style: .time)
//
//            Text("Favorite Emoji:")
//            Text(entry.configuration.favoriteEmoji)
//        }
    }
}

struct RookieKBOWidget: Widget {
    let kind: String = "RookieKBOWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            RookieKBOWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    RookieKBOWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
