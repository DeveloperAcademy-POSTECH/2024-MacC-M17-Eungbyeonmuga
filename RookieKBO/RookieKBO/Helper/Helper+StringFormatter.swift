//
//  Helper+StringFormatter.swift
//  RookieKBO
//
//  Created by crownjoe on 10/10/24.
//

import Foundation
import UIKit

extension String {
    func firstWord() -> String {
        return self.components(separatedBy: " ").first ?? ""
    }
    
    static let teamImages: [String: String] = [
        "ssg": "ssg",
        "kia": "kia",
        "kt": "kt",
        "lg": "lg",
        "nc": "nc",
        "doosan": "doosan", "두산": "doosan",
        "lotte": "lotte", "롯데": "lotte",
        "samsung": "samsung", "삼성": "samsung",
        "kiwoom": "kiwoom", "키움": "kiwoom",
        "hanwha": "hanwha", "한화": "hanwha"
    ]

    static func teamImage(for name: String) -> String? {
        return teamImages[name.lowercased()] ?? "allTeam"
    }
}

func teamImage(for name: String) -> UIImage? {
    let imageName = "\(String.teamImage(for: name) ?? "allTeam")"
    return UIImage(named: imageName)
}


