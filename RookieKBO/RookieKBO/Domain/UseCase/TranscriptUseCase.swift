//
//  TranscriptUseCase.swift
//  RookieKBO
//
//  Created by crownjoe on 11/28/24.
//

import Foundation

@Observable
final class TranscriptUseCase {
    
    private let transcriptService: TranscriptServiceInterface
    
    private(set) var state: State
    private(set) var networkTranscript: NetworkTranscript
    
    init(transcriptService: TranscriptServiceInterface) {
        self.transcriptService = transcriptService
        self.networkTranscript =  NetworkTranscript(
            videoId: "",
            videoTranscript: []
        )
        self.state = State(
            networkTranscript: NetworkTranscript(
                videoId: "",
                videoTranscript: []
            ),
            filterTranscript: []
        )
    }
}

// MARK: - State

extension TranscriptUseCase {
    
    struct State {
        var networkTranscript: NetworkTranscript
        var filterTranscript: [TranscriptItem]?
    }
}

extension TranscriptUseCase {
    
    // 서버에서 자막을 받아오는 함수
    func fetchTranscript(videoId: String) async -> NetworkTranscript {
        let result = await transcriptService.fetchTranscript(videoId: videoId)
        switch result {
        case .success(let fetchedTranscript):
            self.networkTranscript = fetchedTranscript
            updateNetworkTranscript(from: fetchedTranscript)
            return fetchedTranscript
        case .failure(let error):
            print(error)
            return NetworkTranscript(videoId: "", videoTranscript: [])
        }
    }
    
    // 서버 자막 업데이트
    func updateNetworkTranscript(from networkTranscript: NetworkTranscript) {
        state.networkTranscript = networkTranscript
    }
    
    // 필터링 한 자막 업데이트
    func updateFilterTranscript() {
        let networkTranscript = state.networkTranscript
        if let filteredTranscript = getTermDescription(networkTranscript: networkTranscript) {
            state.filterTranscript = filteredTranscript
        } else {
            print("필터 오류남")
            state.filterTranscript = []
        }
    }
}

