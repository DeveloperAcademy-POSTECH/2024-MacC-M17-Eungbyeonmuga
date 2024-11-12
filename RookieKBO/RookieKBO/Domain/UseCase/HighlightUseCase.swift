//
//  HighlightUseCase.swift
//  RookieKBO
//
//  Created by Simmons on 11/8/24.
//

import Foundation

@Observable
final class HighlightUseCase {
    
    private(set) var state: State
    
    init() {
        self.state = State(
            HighlightInfo: nil,
            selectedDate: nil
        )
    }
}

// MARK: - State

extension HighlightUseCase {
    
    struct State {
        var HighlightInfo: [Highlight]?
        var selectedDate: Date?
    }
}

// MARK: - UseCase Method

extension HighlightUseCase {
    
    func fetchSelectedDate(_ selectedDate: Date?) {
        state.selectedDate = selectedDate
    }
    
    // 유효한 날짜인지 확인
    func isValidDate(_ date: Date, from highlightInfo: [Highlight]) -> Bool {
        let validDates = highlightInfo.compactMap { Date().fromStringToDate($0.date) }
        return validDates.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) })
    }
    
    // 해당 날짜에 맞는 Highlight 매칭
    func filterHighlights(for selectedDate: Date, in highlightInfo: [Highlight]) -> [Highlight] {
        highlightInfo.filter {
            guard let date = Date().fromStringToDate($0.date) else {
                return false
            }
            return Calendar.current.isDate(date, inSameDayAs: selectedDate)
        }
    }
    
    // 특정 단어 추출
    func extractHomeAway(from title: String) -> String {
        let components = title.split(separator: " ")
        guard components.count > 5 else { return title }
        return components[3...5].joined(separator: " ")
    }
}
