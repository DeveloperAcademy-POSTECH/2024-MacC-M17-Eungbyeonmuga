//
//  Helper+DateFormatter.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

extension Date {
    func toTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    func toMonthDayString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd"
        return formatter.string(from: self)
    }
    
    func formattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "M월 d일 HH:mm"
        
        return dateFormatter.string(from: self)
    }
    
    static var today: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
    
    func toFormattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }
    
    func fromFormattedString(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.date(from: dateString)
    }
    
    func fromStringToDate(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)
    }
    
    static func getDdayToOpeningDate() -> String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        // 개막일 설정 (2025년 3월 22일)
        guard let openingDate = formatter.date(from: "2025/03/22") else {
            return "데이트 타입 오류"
        }
        
        let components = calendar.dateComponents([.day], from: Date.today, to: openingDate)
        
        if let daysLeft = components.day {
            if daysLeft > 0 {
                return "D-\(daysLeft)"
            } else if daysLeft == 0 {
                return "D-Day"
            } else {
                return " "
            }
        } else {
            return "오류"
        }
    }
}
