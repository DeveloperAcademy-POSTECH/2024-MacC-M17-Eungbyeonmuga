//
//  StubTermService.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation
import SwiftData

@MainActor
final class TermService: TermServiceInterface {
    
    private var modelContainer: ModelContainer?
    private var termEntries: [TermEntry]
    private let termDictionary: [String: String]
    
    init(termDictionary: [String: String]) {
        self.termDictionary = termDictionary
        self.termEntries = []
        
        do {
            modelContainer = try ModelContainer(for: TermEntry.self)
        } catch {
            print("❌ ModelContainer 초기화 중 오류 발생:", error)
        }
    }
    
    // 저장된 용어 출력하는 함수
    func printTermEntries() {
        do {
            let termEntries = try readTermSet()
            for entry in termEntries {
                print("🧃 id: \(entry.id), 용어: \(entry.term), 설명: \(entry.definition)")
            }
        } catch {
            print("❌ TermEntry를 불러오는 중 오류 발생", error)
        }
    }
    
    // 특정 용어를 저장하는 함수
    func createTermEntry(term: String) {
        guard let definition = termDictionary[term] else {
            print("❌ 사전에 정의가 없는 용어입니다: \(term)")
            return
        }
        do {
            let termEntries = try readTermSet()
            
            if termEntries.contains(where: { $0.term == term }) {
                print("⚠️ 이미 저장된 용어입니다 \(term)")
                return
            }
            
            let newEntry = TermEntry(term: term, definition: definition)
            modelContainer?.mainContext.insert(newEntry)
            print("✅ 새로운 TermEntry가 추가됨: \(term) - \(definition)")
            
        } catch {
            print("❌ TermEntry를 불러오거나 추가하는 중 오류 발생", error)
        }
    }
    
    /// 저장된 용어 모델 읽기
    func readTermSet() throws -> [TermEntry] {
        let descriptor = FetchDescriptor<TermEntry>(predicate: nil)
        
        let fetchedEntries = try modelContainer?.mainContext.fetch(descriptor)
        
        return fetchedEntries ?? []
    }
    
    // 저장된 용어 삭제하는 함수
    func deleteTermEntry(term: String) {
        do {
            let termEntries = try readTermSet()
            
            if let entryToDelete = termEntries.first(where: { $0.term == term }) {
                modelContainer?.mainContext.delete(entryToDelete)
                print("✅ \(term) 용어가 삭제")
            } else {
                print("⚠️ 삭제할 용어 없음 \(term)")
            }
            
        } catch {
            print("❌ TermEntry를 읽는 중 오류 발생", error)
        }
    }
}
