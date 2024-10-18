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
    
    

}

