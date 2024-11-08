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
            HighlightInfo: nil
        )
    }
}

// MARK: - State

extension HighlightUseCase {
    
    struct State {
        var HighlightInfo: [Highlight]?
    }
}

// MARK: - UseCase Method

extension HighlightUseCase {
    
}
