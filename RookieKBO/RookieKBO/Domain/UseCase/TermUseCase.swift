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
            savedTerms: []
        )
        filterAndUpdateSavedTerms()
    }
}

// MARK: - State

extension TermUseCase {
    
    struct State {
        var savedTerms : [TermEntry]
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
        filterAndUpdateSavedTerms()
    }
    
    // 저장된 용어 삭제하는 함수
    func deleteTermEntry(term: String) {
        termService.deleteTermEntry(term: term)
        filterAndUpdateSavedTerms()
    }
    
    // 저장된 용어 읽는 함수
    func readTermSet() throws -> [TermEntry] {
        try termService.readTermSet()
    }
    
    // 저장된 용어 isSaved 관리
    func isTermSaved(term: String) -> Bool {
        return state.savedTerms.contains { $0.term == term }
    }
    
    // 필터링 후 업데이트
    private func filterAndUpdateSavedTerms() {
        do {
            let allTerms = try termService.readTermSet()
            self.state.savedTerms = allTerms
        } catch {
            print("저장된 용어를 불러오는 중 오류 발생: \(error)")
        }
    }
}
