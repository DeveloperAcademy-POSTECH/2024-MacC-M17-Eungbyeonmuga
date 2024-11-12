//
//  VideoTranscriptView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/6/24.
//

import SwiftUI
import YouTubePlayerKit

struct VideoTranscriptView: View {
    
    @Environment(TermUseCase.self) private var termUseCase
    
    // 데이터 변경
    @StateObject private var youtubePlayer = YouTubePlayer(
        source: .url("https://www.youtube.com/watch?v=uaK6e95za0w"),
        configuration: YouTubePlayer.Configuration(autoPlay: true)
    )
    
    @State private var searchText = ""
    @State private var playingItemId: UUID?
    @State private var isSearchActive = false
    @State private var isPlaying: Bool = false
    @State private var isSaved: Bool = false
    @State private var savedTerms: [String: Bool] = [:]
    @State private var currentPlaybackTime: TimeInterval = 0
    
    // 데이터 변경
    private let currentTranscript = MockTermBuilder.mockTranscript
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    /// 재생될 때 업데이트 하는 함수
    private func updateIsPlaying(for time: TimeInterval) {
        let matchingItems = currentTranscript.transcript.filter { transcriptItem in
            abs(transcriptItem.start - time) <= 1.0
        }
        
        if let matchingItem = matchingItems.first {
            if termDictionary[matchingItem.text] != nil {
                playingItemId = matchingItem.id
                isPlaying = true
                print("재생중~ \(matchingItem.text) 지금 시간은~ \(time)")
            } else {
                isPlaying = false
                print("매칭 안된 항목: \(matchingItem.text), time: \(time)")
            }
        } else {
            isPlaying = false
            print("매칭 안됐어 짜식아 \(time)")
        }
    }
    
    /// 검색 결과로 뷰를 그리는 함수
    private func searchResultsView(_ items: [TranscriptItem]) -> some View {
        ScrollView {
            ForEach(items.sorted(by: { $0.start < $1.start }), id: \.id) { transcriptItem in
                SearchResult(
                    isPlaying: Binding(
                        get: { playingItemId == transcriptItem.id },
                        set: { isPlaying in
                            playingItemId = isPlaying ? transcriptItem.id : nil
                        }
                    ),
                    searchText: searchText,
                    time: transcriptItem.start
                )
                .simultaneousGesture(
                    TapGesture()
                        .onEnded {
                            youtubePlayer.seek(
                                to: Measurement(value: transcriptItem.start, unit: UnitDuration.seconds),
                                allowSeekAhead: true
                            )
                        }
                )
                .padding(.bottom, 8)
                .padding(.horizontal, 16)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TopView()
            
            YouTubePlayerView(youtubePlayer)
                .frame(height: 220)
            
            if isSearchActive {
                SearchBar(text: $searchText)
            } else {
                TermRow()
                    .onTapGesture {
                        withAnimation {
                            isSearchActive.toggle()
                        }
                    }
            }
            
            if isSearchActive {
                searchContent
            } else {
                termContent
            }
        }
        .onReceive(timer) { _ in
            youtubePlayer.getCurrentTime { result in
                switch result {
                case .success(let time):
                    currentPlaybackTime = time.value
                    updateIsPlaying(for: currentPlaybackTime)
                case .failure(let error):
                    print("재생 시간 가져오는 에러다 짜식아 \(error)")
                }
            }
        }
    }
    
    // MARK: - 검색 콘텐츠
    private var searchContent: some View {
        Group {
            if searchText.isEmpty {
                termContent
            } else {
                let filteredItems = currentTranscript.transcript.filter {
                    $0.text.lowercased().contains(searchText.lowercased())
                }
                
                if filteredItems.isEmpty {
                    noSearchResults
                } else {
                    searchResultsView(filteredItems)
                }
            }
        }
    }
    
    private var noSearchResults: some View {
        VStack {
            Spacer()
            Text("검색 결과가 없어요!")
                .font(.Body.body3)
                .foregroundColor(.gray6)
            Spacer()
        }
    }
    
    private var termContent: some View {
        ScrollViewReader { scrollProxy in
            ZStack {
                ScrollView {
                    VStack {
                        ForEach(currentTranscript.transcript.sorted(by: { $0.start < $1.start }), id: \.id) { transcriptItem in
                            if let description = termDictionary[transcriptItem.text] {
                                let isTermSaved = termUseCase.isTermSaved(term: transcriptItem.text)
                                
                                TermView(
                                    isPlaying: Binding(
                                        get: { playingItemId == transcriptItem.id },
                                        set: { isPlaying in
                                            playingItemId = isPlaying ? transcriptItem.id : nil
                                            if isPlaying {
                                                withAnimation {
                                                    scrollProxy.scrollTo(transcriptItem.id, anchor: .top)
                                                }
                                            }
                                            
                                        }
                                    ),
                                    isSaved: Binding(
                                        get: { isTermSaved },
                                        set: { newValue in
                                            if newValue {
                                                termUseCase.createTermEntry(term: transcriptItem.text)
                                            } else {
                                                termUseCase.deleteTermEntry(term: transcriptItem.text)
                                            }
                                            termUseCase.printTermEntries()
                                        }
                                    ),
                                    term: transcriptItem.text,
                                    description: description,
                                    time: transcriptItem.start
                                )
                                .id(transcriptItem.id)
                                .simultaneousGesture(
                                    TapGesture()
                                        .onEnded {
                                            youtubePlayer.seek(
                                                to: Measurement(value: transcriptItem.start, unit: UnitDuration.seconds),
                                                allowSeekAhead: true
                                            )
                                        }
                                )
                                .padding(.bottom, 8)
                                .padding(.horizontal, 16)
                                
                                .onAppear {
                                    if playingItemId == transcriptItem.id {
                                        withAnimation {
                                            scrollProxy.scrollTo(transcriptItem.id, anchor: .top)
                                        }
                                    }
                                }
                                .onChange(of: playingItemId) {
                                    if let playingItemId {
                                        withAnimation {
                                            scrollProxy.scrollTo(playingItemId, anchor: .top)
                                        }
                                    }
                                }
                            } else {
                                EmptyView()
                            }
                        }
                    }
                }
                if isSearchActive {
                    Rectangle()
                        .foregroundColor(.gray6)
                        .opacity(0.3)
                        .padding(.top, -16)
                        .onTapGesture {
                            withAnimation {
                                isSearchActive.toggle()
                            }
                        }
                        .edgesIgnoringSafeArea(.all)
                }
            }
            .padding(.top, 16)
        }
    }
    
    
}

// MARK: - TopView

private struct TopView: View {
    var body: some View {
        HStack(spacing: 0) {
            HStack(alignment: .lastTextBaseline, spacing: 0) {
                Text("삼성 vs KIA")
                    .font(.CustomTitle.customTitle2)
                    .foregroundColor(.gray1)
                    .padding(.trailing, 16)
                
                Text("2024.10.28")
                    .font(.Body.body5)
                    .foregroundColor(.gray1)
            }
            
            Spacer()
            
            Image(systemName: "xmark")
                .font(.Head.head3)
                .foregroundStyle(.white0)
                .onTapGesture {
                    // 창닫기 기능
                }
        }
        .padding(.bottom, 24)
        .padding(.horizontal, 16)
        .background(Color.brandPrimary)
    }
}

// MARK: - TermRow

private struct TermRow: View {
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "baseball")
                .padding(.trailing, 4)
                .foregroundColor(.gray7)
            
            
            Text("루키를 위한 야구 용어")
                .font(.Body.body1)
                .foregroundColor(.gray7)
            
            Spacer()
            
            HStack(spacing: 8) {
                Text("키워드 검색")
                    .font(.Body.body1)
                    .foregroundColor(.gray7)
                
                Image(.iconSearch)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(99)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(.gray2)
    }
}

// MARK: - SearchBar

private struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray7)
                
                TextField("선수명 등 키워드를 검색하고 타임라인 이동", text: $text)
                    .font(text.isEmpty ? .Body.body3 : .Body.body2)
                    .foregroundColor(text.isEmpty ? .gray5 : .gray7)
                
                if !text.isEmpty {
                    Button {
                        self.text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .foregroundColor(.gray7)
            .background(.white0)
            .cornerRadius(99)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(.gray2)
    }
}


#Preview {
    VideoTranscriptView()
        .environment(PreviewHelper.mockTermUseCase)
}
