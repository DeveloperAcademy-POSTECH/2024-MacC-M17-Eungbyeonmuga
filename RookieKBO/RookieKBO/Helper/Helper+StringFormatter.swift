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
}
