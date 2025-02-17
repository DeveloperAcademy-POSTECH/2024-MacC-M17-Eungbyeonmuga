//
//  HighlightServiceInterface.swift
//  RookieKBO
//
//  Created by Simmons on 11/12/24.
//

import Foundation

protocol HighlightServiceInterface {
    func fetchHighlight() async -> Result<[Highlight], Error>
    func isValidDate(_ date: Date, from highlightInfo: [Highlight]) -> Bool
    func filterHighlights(for selectedDate: Date?, teamName: String?, in highlightInfo: [Highlight]) -> [Highlight]
    func extractHomeAway(from title: String) -> String
    func fetchMockHighlightsInfo() -> [Highlight]
    func loadTranscript(from filename: String) -> VideoTranscript?
}
