//
//  AppIntent.swift
//  RookieKBOWidget
//
//  Created by crownjoe on 10/11/24.
//

import WidgetKit
import AppIntents

struct SelectTeamAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Select Team" }
    
    // TODO: 분기 처리
    @Parameter(title: "Team", default: .allType)
    var selectedTeam: SelectTeamType
}

enum SelectTeamType: String, AppEnum {
    case allType, ssgType, lgType, lotteType, samsungType, doosanType, kiaType, kiwoomType, hanhwaType, ktType, ncType
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Team Type"
    static var caseDisplayRepresentations: [SelectTeamType : DisplayRepresentation] = [
        .allType: "전체",
        .ssgType: "SSG 랜더스",
        .lgType: "LG 트윈스",
        .lotteType: "롯데 자이언츠",
        .samsungType: "삼성 라이온즈",
        .doosanType: "두산 베어스",
        .kiaType: "기아 타이거즈",
        .kiwoomType: "키움 히어로즈",
        .hanhwaType: "한화 이글스",
        .ktType: "KT 위즈",
        .ncType: "NC 다이노스",
    ]
}
