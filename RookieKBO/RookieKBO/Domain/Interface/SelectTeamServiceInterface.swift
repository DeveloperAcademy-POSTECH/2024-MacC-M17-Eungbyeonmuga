//
//  SelectTeamServiceInterface.swift
//  RookieKBO
//
//  Created by Simmons on 10/13/24.
//

import Foundation

protocol SelectTeamServiceInterface {
    func fetchAllTeam() -> [Team]
    func updateUserDefaultsTeamObject(_ selectTeam: Team)
    func getUserDefaultsTeamObject() -> Team?
}
