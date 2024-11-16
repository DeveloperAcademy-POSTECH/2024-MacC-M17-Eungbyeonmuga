//
//  WidgetMatchManager.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 10/13/24.
//

import Foundation
import SwiftUI


// 점수 기준으로 승, 패 및 색 반환
func getResult(for teamScore: Int, otherScore: Int) -> WidgetMatchResult {
    if teamScore > otherScore {
        return .win
    } else if teamScore < otherScore {
        return .lose
    } else {
        return .draw
    }
}

enum WidgetMatchResult {
    case win
    case lose
    case draw
    
    var color: Color {
        switch self {
        case .win:
            return .widget100
        case .lose:
            return .widget30
        case .draw:
            return .widget50
        }
    }
    
    var description: String {
        switch self {
        case .win:
            return "승"
        case .lose:
            return "패"
        case .draw:
            return "무"
        }
    }
}

// 선택한 팀 반환 함수
func getSelectTeam() -> SelectTeamType {
    let stubSelectTeamService = StubSelectTeamService()
    guard let selectTeam = stubSelectTeamService.getUserDefaultsTeamObject() else {
        return .allType
    }
    
    switch selectTeam.name {
    case "SSG 랜더스":
        return .ssgType
    case "LG 트윈스":
        return .lgType
    case "롯데 자이언츠":
        return .lotteType
    case "삼성 라이온즈":
        return .samsungType
    case "두산 베어스":
        return .doosanType
    case "KIA 타이거즈":
        return .kiaType
    case "키움 히어로즈":
        return .kiwoomType
    case "한화 이글스":
        return .hanwhaType
    case "KT 위즈":
        return .ktType
    case "NC 다이노스":
        return .ncType
    default:
        return .allType
    }
}

// 각 팀의 색 반환을 위한 함수
func colorString(for teamType: SelectTeamType) -> String {
    switch teamType {
    case .allType:
        return "allTeam"
    case .ssgType:
        return "ssg"
    case .lgType:
        return "lg"
    case .lotteType:
        return "lotte"
    case .samsungType:
        return "samsung"
    case .doosanType:
        return "doosan"
    case .kiaType:
        return "kia"
    case .kiwoomType:
        return "kiwoom"
    case .hanwhaType:
        return "hanwha"
    case .ktType:
        return "kt"
    case .ncType:
        return "nc"
    }
}

// 각 팀의 캐릭터 이미지 반환을 위한 함수
func teamTypeCharacterString(for teamType: SelectTeamType) -> String {
    switch teamType {
    case .allType:
        return "widget_all"
    case .ssgType:
        return "widget_ssg"
    case .lgType:
        return "widget_lg"
    case .lotteType:
        return "widget_lotte"
    case .samsungType:
        return "widget_samsung"
    case .doosanType:
        return "widget_doosan"
    case .kiaType:
        return "widget_kia"
    case .kiwoomType:
        return "widget_kiwoom"
    case .hanwhaType:
        return "widget_hanwha"
    case .ktType:
        return "widget_kt"
    case .ncType:
        return "widget_nc"
    }
}

// 각 팀의 캐릭터 이미지 반환을 위한 함수
func teamCharacterString(for team: Team) -> String {
    switch team.name {
    case "전체 구단":
        return "widget_all"
    case "SSG 랜더스":
        return "widget_ssg"
    case "LG 트윈스":
        return "widget_lg"
    case "롯데 자이언츠":
        return "widget_lotte"
    case "삼성 라이온즈":
        return "widget_samsung"
    case "두산 베어스":
        return "widget_doosan"
    case "KIA 타이거즈":
        return "widget_kia"
    case "키움 히어로즈":
        return "widget_kiwoom"
    case "한화 이글스":
        return "widget_hanwha"
    case "KT 위즈":
        return "widget_kt"
    case "NC 다이노스":
        return "widget_nc"
    default:
        return "widget_all"
    }
}

// 서버에서 매치를 가져오는 함수
private func fetchMatchesFromServer() async -> Result<[Match], Error> {
    let matchUseCase = MatchUseCase(matchService: MatchServiceImpl())
    // TODO: 날짜 변경
    let result = await matchUseCase.fetchMatches(date: Date.today.toFormattedString())
    return result
}

// 서버에서 받아온 매치 배열에서 필터링하는 함수
func filterMatches() async -> Match? {
    let stubSelectTeamService = StubSelectTeamService()
    let selectedTeam = stubSelectTeamService.getUserDefaultsTeamObject()
    
    var filteredMatches: [Match] = []
    let result = await fetchMatchesFromServer()
    
    switch result {
    case .success(let matches):
        filteredMatches = matches
    case .failure(let error):
        print("fetch 에러 \(error)")
        return nil
    }
    
    if selectedTeam?.name != "전체 구단" {
        filteredMatches = filteredMatches.filter { match in
            match.homeTeam.name == selectedTeam?.name || match.awayTeam.name == selectedTeam?.name
        }
    }
    
    for state in [GameState.PLAYING, .PREPARE, .END, .CANCEL] {
        if let match = filteredMatches.first(where: { $0.gameState == state }) {
            return match
        }
    }
    return nil
}

// 목업 데이터 필터링 함수
func filterMatches(matches: [Match]) -> Match? {
    let stubSelectTeamService = StubSelectTeamService()
    let selectedTeam = stubSelectTeamService.getUserDefaultsTeamObject()
    let filteredMatches: [Match]
    
    if selectedTeam?.name == "전체 구단" {
        filteredMatches = matches
    } else {
        filteredMatches = matches.filter { match in
            match.homeTeam.name == selectedTeam?.name || match.awayTeam.name == selectedTeam?.name
        }
    }
    print("🍎", filteredMatches)
    
    let todayMatches = filteredMatches.filter {
        Calendar.current.isDate($0.startDateTime, inSameDayAs: Date.today)
    }
    
    if !todayMatches.isEmpty {
        return todayMatches.sorted(by: { $0.startDateTime < $1.startDateTime }).first
    }
    
    for state in [GameState.PLAYING, .PREPARE, .END, .CANCEL] {
        if let match = todayMatches.first(where: { $0.gameState == state }) {
            return match
        }
    }
    
    let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date.today)!
    if let tomorrowPrepareMatch = filteredMatches.first(where: {
        Calendar.current.isDate($0.startDateTime, inSameDayAs: tomorrow) && $0.gameState == .PREPARE
    }) {
        return tomorrowPrepareMatch
    }
    
    let futureMatches = filteredMatches.filter { $0.startDateTime > Date() }
    return futureMatches.sorted(by: { $0.startDateTime < $1.startDateTime }).first
}
