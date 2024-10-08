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
            Team(name: "SSG 랜더스", image: "팀1"),
            Team(name: "KIA 타이거즈", image: "팀2"),
            Team(name: "KT 위즈", image: "팀3"),
            Team(name: "LG 트윈스", image: "팀4"),
            Team(name: "NC 다이노스", image: "팀5"),
            Team(name: "두산 베어스", image: "팀6"),
            Team(name: "롯데 자이언츠", image: "팀7"),
            Team(name: "삼성 라이온즈", image: "팀8"),
            Team(name: "키움 히어로즈", image: "팀9"),
            Team(name: "한화 이글즈", image: "팀10"),
            Team(name: "전체 구단", image: "팀11")]
    }
}
