//
//  HighlightUseCase.swift
//  RookieKBO
//
//  Created by Simmons on 11/8/24.
//

import Foundation

@Observable
final class HighlightUseCase {
    
    private let highlightService: HighlightServiceInterface
    
    private(set) var state: State
    
    init(highlightService: HighlightServiceInterface) {
        self.highlightService = highlightService
        self.state = State(
            HighlightInfo: highlightService.fetchMockHighlightsInfo(),
            selectedDate: nil
        )
    }
}

// MARK: - State

extension HighlightUseCase {
    
    struct State {
        var HighlightInfo: [Highlight]
        var selectedTeamName: String?
        var selectedDate: Date?
        var selectedHighlight: Highlight?
        var videoUrl: String?
//        var filterTranscript: [TranscriptItem]?
    }
}

// MARK: - UseCase Method

extension HighlightUseCase {
    
    func fetchSelectedDate(_ selectedDate: Date?) {
        state.selectedDate = selectedDate
    }
    
    func fecthSelectedTeam(_ selectedTeamName: String?) {
        state.selectedTeamName = selectedTeamName
    }
    
    // 유효한 날짜인지 확인
    func isValidDate(_ date: Date, from highlightInfo: [Highlight]) -> Bool {
        highlightService.isValidDate(date, from: highlightInfo)
    }
    
    // 해당 날짜에 맞는 Highlight 매칭
    func filterHighlights(for selectedDate: Date?, teamName: String?, in highlightInfo: [Highlight]) -> [Highlight] {
        highlightService.filterHighlights(for: selectedDate, teamName: teamName, in: highlightInfo)
    }
    
    // 특정 단어 추출
    func extractHomeAway(from title: String) -> String {
        highlightService.extractHomeAway(from: title)
    }
    
    /// 선택한 하이라이트 영상 정보 업데이트
    func updateSelectedeHighlight(highlight: Highlight) {
        var currentHighlight = highlight
        currentHighlight.title = extractHomeAway(from: highlight.title)
        state.selectedHighlight = currentHighlight
    }
    
    /// 선택한 url 업데이트
    func updateVideoUrl() {
        let videoId = state.selectedHighlight?.videoId
        state.videoUrl = "https://www.youtube.com/watch?v=\(videoId ?? "")"
    }
    
//    /// txt 파일에서 자막 가져오는 함수
//    func loadTranscript(from filename: String) -> VideoTranscript? {
//        highlightService.loadTranscript(from: filename)
//    }
//    
//    /// 필터링 한 자막 가져오는 함수
//    func filterData() {
//        if let videoTranscript = loadTranscript(from: state.selectedHighlight?.videoId ?? "") {
//            if let filteredTranscript = getTermDescription(videoTranscript: videoTranscript) {
//                state.filterTranscript = filteredTranscript
//            } else {
//                print("필터 오류남")
//                state.filterTranscript = []
//            }
//        } else {
//            print("비디오 자막 로드 실패")
//            state.filterTranscript = []
//        }
//    }
}
