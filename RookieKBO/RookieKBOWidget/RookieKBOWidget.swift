//
//  RookieKBOWidget.swift
//  RookieKBOWidget
//
//  Created by crownjoe on 10/11/24.
//

import WidgetKit
import SwiftUI

// 위젯 업데이트 로직
struct Provider: AppIntentTimelineProvider {
    // 위젯 초기 상태, 네트워크 요청시 요청이 완료되기 전까지 보여줄 기본 데이터
    // 데이터를 불러올 때 초기에 로딩이 발생하는 경우에만
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    // 위젯 갤러리에 샘플로 보여지는 부분, 미리보기
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    // 정의한 타임라인에 맞게 업데이트해서 보여지는 내용
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // 진행중일 때 -> 변화가 있을 때만
        // 예정 시간 지났을 때
        // 경기 끝났을 때
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
        // policy : 이 타입이 위젯에 새로운 타임라인을 제공해주는 시기(리로드 시점)지정
        //.atEnd 현재 주어진 타임라인이 마지막일 때 새로운 타임라인 요청
        //.after 해당 시점 후에 새로운 타임라인 요청
        //.never 더 이상 요청하지 않을 때
    }
}

// 위젯 데이터 관리
struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    var match: Match?
}

// 위젯 뷰
struct RookieKBOWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 14) {
                VStack(spacing: 8) {
                    Image("\(entry.match?.awayTeam.image ?? "")")
                        .frame(width: 40, height: 40)
                    
                    Text("\(entry.match?.awayTeam.name.firstWord() ??  "")")
                        .font(.Caption.caption1)
                }
            
                Text("VS")
                    .font(.Caption.caption2)

                VStack(spacing: 8) {
                    Image("\(entry.match?.homeTeam.image ?? "")")
                        .frame(width: 40, height: 40)
                    
                    HStack(spacing: 2) {
                        Text("\(entry.match?.homeTeam.name.firstWord() ??  "")")
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
            .padding(.bottom, 14)
            
            Text("우천 취소")
            
            Text("\(entry.match?.startDateTime.toTimeString() ?? "")")
            
            Text("\(entry.match?.startDateTime.formattedString() ?? "")")
                .font(.Body.body2)
                .padding(.bottom, 4)
            
            Text("\(entry.match?.place ?? "")")
                .font(.Caption.caption2)
            
        }
    }
}

struct RookieKBOWidget: Widget {
    let kind: String = "RookieKBOWidget"

    var body: some WidgetConfiguration {
        
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
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
}

//#Preview(as: .systemSmall) {
//    RookieKBOWidget()
//} timeline: {
//    SimpleEntry(date: .now, configuration: .ssgType, match: Match(
//        startDateTime: Date(),
//        gameState: GameState.CANCEL,
//        homeTeam: Team(name: "SSG 랜더스", image: " "),
//        awayTeam: Team(name: "KIA 타이거즈", image: " "),
//        place: "인천 SSG랜더스필드",
//        scoreBoard: [
//            ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 1, 0 ]),
//            ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 1, 1])
//        ]
//    ))
//}
