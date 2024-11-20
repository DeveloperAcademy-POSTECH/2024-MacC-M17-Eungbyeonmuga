//
//  StubTermService.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation
import SwiftData

final class TermServiceImpl: TermServiceInterface {
    
    private let termDictionary: [String: String]
    
    init(termDictionary: [String: String]) {
        self.termDictionary = termDictionary
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
                TranscriptItem(id: UUID(), text: $0.text, description: "", start: $0.start)
            }
            
            return VideoTranscript(videoId: rawTranscript.video_id, transcript: transcriptItems)
            
        } catch {
            print("파일 읽기 또는 파싱 에러: \(error)")
            return nil
        }
    }
}
