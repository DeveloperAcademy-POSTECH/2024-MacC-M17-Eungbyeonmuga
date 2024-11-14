//
//  TermUseCase.swift
//  RookieKBO
//
//  Created by crownjoe on 11/6/24.
//

import Foundation
import SwiftData

@Observable
final class TermUseCase {
    
    private let termService: TermServiceInterface
    
    private(set) var state: State
    
    init(termService: TermServiceInterface) {
        self.termService = termService
        self.state = State(
        )
    }
}

// MARK: - State

extension TermUseCase {
    
    struct State {
        //
    }
}

// MARK: - TermUseCase Method

extension TermUseCase {
    
    // 함수 작성..
}
