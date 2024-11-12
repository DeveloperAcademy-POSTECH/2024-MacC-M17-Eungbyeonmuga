//
//  HighlightUseCase.swift
//  RookieKBO
//
//  Created by Simmons on 11/8/24.
//

import Foundation

@Observable
final class HighlightUseCase {
    
    private let highlightService: HighlightServiceInterface
    
    private(set) var state: State
    
    init(highlightService: HighlightServiceInterface) {
        self.highlightService = highlightService
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
        highlightService.isValidDate(date, from: highlightInfo)
    }
    
    // 해당 날짜에 맞는 Highlight 매칭
    func filterHighlights(for selectedDate: Date, in highlightInfo: [Highlight]) -> [Highlight] {
        highlightService.filterHighlights(for: selectedDate, in: highlightInfo)
    }
    
    // 특정 단어 추출
    func extractHomeAway(from title: String) -> String {
        highlightService.extractHomeAway(from: title)
    }
}
