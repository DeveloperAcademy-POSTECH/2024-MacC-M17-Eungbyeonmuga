//
//  HighlightServiceImpl.swift
//  RookieKBO
//
//  Created by Simmons on 11/12/24.
//

import Foundation

final class HighlightServiceImpl: HighlightServiceInterface {
    
    func isValidDate(_ date: Date, from highlightInfo: [Highlight]) -> Bool {
        let validDates = highlightInfo.compactMap { Date().fromStringToDate($0.date) }
        return validDates.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) })
    }
    
    func filterHighlights(for selectedDate: Date, in highlightInfo: [Highlight]) -> [Highlight] {
        highlightInfo.filter {
            guard let date = Date().fromStringToDate($0.date) else {
                return false
            }
            return Calendar.current.isDate(date, inSameDayAs: selectedDate)
        }
    }
    
    func extractHomeAway(from title: String) -> String {
        let components = title.split(separator: " ")
        guard components.count > 5 else { return title }
        return components[3...5].joined(separator: " ")
    }
    
    func fetchMockHighlightsInfo() -> [Highlight] {
        return MockDataBuilder.mockHighlightInfo
    }
}
