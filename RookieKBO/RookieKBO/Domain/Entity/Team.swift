//
//  Team.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/7/24.
//

import Foundation

struct Team: Codable, Identifiable, Equatable {
    // ID
    var id: UUID
    // 이름
    var name: String
    // 팀 로고 이미지
    var image: String
    // 팀 색상
    var color: String
    
    init(
        name: String, image: String, color: String
    ) {
        self.id = UUID()
        self.name = name
        self.image = image
        self.color = color
    }
    
    // Team 비교 연산을 위한 함수
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.id == rhs.id
    }
}
