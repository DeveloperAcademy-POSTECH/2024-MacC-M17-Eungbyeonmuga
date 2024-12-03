//
//  Helper+DateFormatter.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

extension DateFormatter {
    static func customFormatter(format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
}

extension Date {
    func toTimeString() -> String {
        return DateFormatter.customFormatter(format: "HH:mm").string(from: self)
    }
    
    func toMonthDayString() -> String {
        return DateFormatter.customFormatter(format: "MM.dd").string(from: self)
    }
    
    func formattedString() -> String {
        let formatter = DateFormatter.customFormatter(format: "M월 d일 HH:mm")
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: self)
    }
    
    static var today: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
    
    func toFormattedString() -> String {
        return DateFormatter.customFormatter(format: "yyyyMMdd").string(from: self)
    }
    
    func fromFormattedString(_ dateString: String) -> Date? {
        return DateFormatter.customFormatter(format: "yyyyMMdd").date(from: dateString)
    }
    
    func fromStringToDate(_ dateString: String) -> Date? {
        return DateFormatter.customFormatter(format: "yyyy-MM-dd").date(from: dateString)
    }
    
    /// 개막일까지 남은 기간 반환
    func getDdayToOpeningDate() -> String {
        let calendar = Calendar.current
        guard let openingDate = DateFormatter.customFormatter(format: "yyyy/MM/dd").date(from: "2025/03/22") else {
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
    
    static func daysLeftToOpeningDate() -> Int? {
        let calendar = Calendar.current
        
        let timeZone = TimeZone(identifier: "Asia/Seoul")!
        let now = Date()
        let localDate = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: now)!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.timeZone = timeZone
        
        guard let openingDate = formatter.date(from: "2025/03/22") else {
            return nil
        }
        
        let components = calendar.dateComponents([.day], from: localDate, to: openingDate)
        
        return components.day
    }
    
    static var regularSeasonStart: Date {
        return DateFormatter.customFormatter(format: "yyyy/MM/dd").date(from: "2024/03/23") ?? Date()
    }
    
    static var regularSeasonEnd: Date {
        return DateFormatter.customFormatter(format: "yyyy/MM/dd").date(from: "2024/10/01") ?? Date()
    }
    
    static var postSeasonStart: Date {
        return DateFormatter.customFormatter(format: "yyyy/MM/dd").date(from: "2024/10/02") ?? Date()
    }
    
    static var postSeasonEnd: Date {
        return DateFormatter.customFormatter(format: "yyyy/MM/dd").date(from: "2024/10/28") ?? Date()
    }
    
    static var newSeasonStart: Date {
        return DateFormatter.customFormatter(format: "yyyy/MM/dd").date(from: "2025/03/22") ?? Date()
    }
    
    /// 포스트 시즌 및 정규 시즌 판별
    func getSeasonType() -> String {
        if self >= Date.regularSeasonStart && self <= Date.regularSeasonEnd {
            return "정규 시즌"
        } else if self >= Date.postSeasonStart && self <= Date.postSeasonEnd {
            return "포스트 시즌"
        } else {
            return "TODAY"
        }
    }
}
