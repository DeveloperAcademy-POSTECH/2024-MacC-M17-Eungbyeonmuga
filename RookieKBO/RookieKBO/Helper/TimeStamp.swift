//
//  TimeStamp.swift
//  RookieKBO
//
//  Created by crownjoe on 11/15/24.
//

import Foundation

/// 디버깅하는 함수
class TimeStamp {
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter
    }()
    
    func printTime(_ message: String = "") {
        print("\(message) : \(dateFormatter.string(from: Date()))")
    }
}
