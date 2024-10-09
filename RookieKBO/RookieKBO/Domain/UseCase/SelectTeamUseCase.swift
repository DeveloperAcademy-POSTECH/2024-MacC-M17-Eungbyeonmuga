//
//  SelectTeamUseCase.swift
//  RookieKBO
//
//  Created by Simmons on 10/8/24.
//

import Foundation

final class SelectTeamUseCase : ObservableObject {
    
    @Published var teams: [Team] = []
    @Published var selectedTeam: Team?
    @Published var isSelectButtonPresented: Bool = false
    
    init() {
        self.teams = [
            Team(name: "SSG 랜더스", image: "SSG_under"),
            Team(name: "KIA 타이거즈", image: "KIA_under"),
            Team(name: "KT 위즈", image: "KT_under"),
            Team(name: "LG 트윈스", image: "LG_under"),
            Team(name: "NC 다이노스", image: "NC_under"),
            Team(name: "두산 베어스", image: "Doosan_under"),
            Team(name: "롯데 자이언츠", image: "Lotte_under"),
            Team(name: "삼성 라이온즈", image: "Samsung_under"),
            Team(name: "키움 히어로즈", image: "Kiwoom_under"),
            Team(name: "한화 이글즈", image: "Hanwha_under"),
            Team(name: "전체 구단", image: "All_under")]
    }
}
