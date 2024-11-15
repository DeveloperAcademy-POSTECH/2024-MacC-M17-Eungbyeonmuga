//
//  StubTermService.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation
import SwiftData

@MainActor
final class TermServiceImpl: TermServiceInterface {
    
    private let termDictionary: [String: String]
    
    init(termDictionary: [String: String]) {
        self.termDictionary = termDictionary
    }
    
    // 함수 작성..
}
