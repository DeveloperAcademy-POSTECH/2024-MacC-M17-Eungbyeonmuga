//
//  TermEntry.swift
//  RookieKBO
//
//  Created by crownjoe on 11/6/24.
//

import Foundation
import SwiftData

@Model
class TermEntry {
    @Attribute(.unique) var id: UUID
    var term: String
    var definition: String
    
    
    init(term: String, definition: String) {
        self.term = term
        self.definition = definition
        self.id = UUID()
    }
}
