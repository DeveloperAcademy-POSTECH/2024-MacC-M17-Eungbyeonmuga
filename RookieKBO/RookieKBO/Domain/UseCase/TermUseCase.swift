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
    private(set) var modelContainer: ModelContainer?
    
    init(termService: TermServiceInterface) {
        self.termService = termService
        self.state = State(
            termEntries: []
        )
    }
}

// MARK: - State

extension TermUseCase {
    
    struct State {
        var termEntries : [TermEntry]
    }
}

// MARK: - TermUseCase Method

extension TermUseCase {
    
    /// 로그 확인용 저장한 용어 출력하는 함수
    func printTermEntries() {
        termService.printTermEntries()
    }
    
    // 특정 용어를 저장하는 함수
    func createTermEntry(term: String) {
        termService.createTermEntry(term: term)
    }
    
    // 저장된 용어 삭제하는 함수
    func deleteTermEntry(term: String) {
        termService.deleteTermEntry(term: term)
    }
    
    
}
