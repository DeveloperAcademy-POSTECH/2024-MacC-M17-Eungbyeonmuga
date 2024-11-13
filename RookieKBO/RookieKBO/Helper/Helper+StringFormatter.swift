//
//  Helper+StringFormatter.swift
//  RookieKBO
//
//  Created by crownjoe on 10/10/24.
//

import Foundation

extension String {
    func firstWord() -> String {
        return self.components(separatedBy: " ").first ?? ""
    }
    
    static func teamImage(for name: String) -> String? {
        switch name.lowercased() {
        case "ssg":
            return "ssg"
        case "kia":
            return "kia"
        case "kt":
            return "kt"
        case "lg":
            return "lg"
        case "nc":
            return "nc"
        case "doosan", "두산":
            return "doosan"
        case "lotte", "롯데":
            return "lotte"
        case "samsung", "삼성":
            return "samsung"
        case "kiwoom", "키움":
            return "kiwoom"
        case "hanwha", "한화":
            return "hanwha"
        default:
            return "allTeamImage"
        }
    }
    
}
