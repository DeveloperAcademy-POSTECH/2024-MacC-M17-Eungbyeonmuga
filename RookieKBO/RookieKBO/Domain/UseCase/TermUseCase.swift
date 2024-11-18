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
    
    /// txt 파일을 읽어서 해당 비디오 자막 반환
    func loadTranscript(from filename: String) -> VideoTranscript? {
        termService.loadTranscript(from: filename)
    }
}
