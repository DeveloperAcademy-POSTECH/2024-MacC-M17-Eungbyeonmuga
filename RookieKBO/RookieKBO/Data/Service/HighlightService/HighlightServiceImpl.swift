//
//  HighlightServiceImpl.swift
//  RookieKBO
//
//  Created by Simmons on 11/12/24.
//

import Foundation

final class HighlightServiceImpl: HighlightServiceInterface {
    
    func isValidDate(_ date: Date, from highlightInfo: [Highlight]) -> Bool {
        let validDates = highlightInfo.compactMap { Date().fromStringToDate($0.date) }
        return validDates.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) })
    }
    
    func filterHighlights(for selectedDate: Date?, teamName: String?, in highlightInfo: [Highlight]) -> [Highlight] {
        highlightInfo.filter {
            // 날짜 필터링 조건
            var isDateMatch = true
            if let selectedDate = selectedDate,
               let date = Date().fromStringToDate($0.date) {
                isDateMatch = Calendar.current.isDate(date, inSameDayAs: selectedDate)
            }

            // 팀 이름 필터링 조건
            var isTeamMatch = true
            if let teamName = teamName, teamName != "전체" {
                isTeamMatch = $0.title.contains(teamName)
            }

            return isDateMatch && isTeamMatch
        }
    }
    
    func extractHomeAway(from title: String) -> String {
        let components = title.split(separator: " ")
        guard components.count > 5 else { return title }
        return components[3...5].joined(separator: " ")
    }
    
    func fetchMockHighlightsInfo() -> [Highlight] {
        return MockDataBuilder.mockHighlightInfo
    }
    
    func loadTranscript(from filename: String) -> VideoTranscript? {
        guard let filePath = Bundle.main.path(forResource: filename, ofType: "txt") else {
            print("파일을 찾을 수 없습니다: \(filename)")
            return nil
        }
        
        do {
            // 파일 내용 읽기
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
            
            // JSON 파싱
            let decoder = JSONDecoder()
            let data = fileContents.data(using: .utf8)!
            
            // JSON 파일 구조
            struct RawTranscript: Codable {
                let video_id: String
                let transcript: [RawTranscriptItem]
            }
            
            struct RawTranscriptItem: Codable {
                let text: String
                let start: Double
            }
            
            let rawTranscript = try decoder.decode(RawTranscript.self, from: data)
            
            let transcriptItems = rawTranscript.transcript.map {
                TranscriptItem(id: "", text: $0.text, description: "", start: $0.start)
            }
            
            return VideoTranscript(videoId: rawTranscript.video_id, transcript: transcriptItems)
            
        } catch {
            print("파일 읽기 또는 파싱 에러: \(error)")
            return nil
        }
    }
}
