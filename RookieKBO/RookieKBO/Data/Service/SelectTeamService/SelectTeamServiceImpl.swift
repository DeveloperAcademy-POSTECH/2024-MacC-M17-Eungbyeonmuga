//
//  SelectTeamServiceImpl.swift
//  RookieKBO
//
//  Created by Simmons on 10/13/24.
//

import Foundation

struct SelectTeamServiceImpl: SelectTeamServiceInterface {
    func fetchAllTeam() -> [Team] {
        return [
            Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg", backgroundImage: "ssgBg"),
            Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia", backgroundImage: "kiaBg"),
            Team(name: "KT 위즈", image: "ktUnder", color: "kt", backgroundImage: "ktBg"),
            Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
            Team(name: "NC 다이노스", image: "ncUnder", color: "nc", backgroundImage: "ncBg"),
            Team(name: "두산 베어스", image: "doosanUnder", color: "doosan", backgroundImage: "doosanBg"),
            Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
            Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung", backgroundImage: "samsungBg"),
            Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
            Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
            Team(name: "전체 구단", image: "allTeamUnder", color: "allTeam", backgroundImage: "allTeamBg")
        ]
    }
    
    func updateUserDefaultsTeamObject(_ team: Team) {
        let encoder = JSONEncoder()
        
        do {
            let encodedTeam = try encoder.encode(team)
            print("encodedTeam: \(encodedTeam)")
            UserDefaults.shared.set(encodedTeam, forKey: "selectTeamObject")
            print("Team object saved successfully.")
        } catch {
            print("Failed to encode and save team object: \(error)")
        }
        
    }
    
    func getUserDefaultsTeamObject() -> Team? {
        let decoder = JSONDecoder()
        
        if let savedTeamData = UserDefaults.shared.data(forKey: "selectTeamObject") {
            do {
                let loadedTeam = try decoder.decode(Team.self, from: savedTeamData)
                print("loadedTeam: \(loadedTeam)")
                return loadedTeam
            } catch {
                print("Failed to decode team object: \(error)")
            }
        }
        return nil
    }
}
