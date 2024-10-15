//
//  StubSelectTeamService.swift
//  RookieKBO
//
//  Created by Simmons on 10/13/24.
//

import Foundation

struct StubSelectTeamService: SelectTeamServiceInterface {
    func fetchAllTeam() -> [Team] {
        return [
            Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg"),
            Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia"),
            Team(name: "KT 위즈", image: "ktUnder", color: "kt"),
            Team(name: "LG 트윈스", image: "lgUnder", color: "lg"),
            Team(name: "NC 다이노스", image: "ncUnder", color: "nc"),
            Team(name: "두산 베어스", image: "doosanUnder", color: "doosan"),
            Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte"),
            Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung"),
            Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom"),
            Team(name: "한화 이글즈", image: "hanwhaUnder", color: "hanwha"),
            Team(name: "전체 구단", image: "allTeamUnder", color: "primary")
        ]
    }
    
    func updateUserDefaultsTeam(_ selectTeamName: String) {
        UserDefaults.shared.removeObject(forKey: "selectTeam")
        UserDefaults.shared.set(selectTeamName, forKey: "selectTeam")
    }
}
