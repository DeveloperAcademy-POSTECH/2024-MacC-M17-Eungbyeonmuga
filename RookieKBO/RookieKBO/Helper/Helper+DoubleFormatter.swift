//
//  Helper+DoubleFormatter.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation

extension Double {
    /// Double 값을 "분:초" 형식으로 변환
    func toTimeFormat() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
}
