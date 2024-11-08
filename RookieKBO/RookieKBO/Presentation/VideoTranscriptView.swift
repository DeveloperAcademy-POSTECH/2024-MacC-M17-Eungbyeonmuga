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
    
    @State private var searchText = ""
    @State private var isSearchActive = false
    @State private var isPlaying: Bool = false
    @State private var playingItemId: UUID?
    
    // 실제 데이터로 변경
    let currentTranscript = MockTermBuilder.mockTranscript
    
    // 실제 데이터로 변경
    var youtubeId = [
        YouTubePlayer(stringLiteral: "https://www.youtube.com/watch?v=uaK6e95za0w")
    ]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TopView()
            
            YouTubePlayerView(youtubeId.first ?? "")
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
            
            // MARK: - 하이라이트 재생 시 용어 정리
            
            if !isSearchActive {
                ScrollView {
                    ForEach(currentTranscript.transcript.sorted(by: { $0.start < $1.start }), id: \.id) { transcriptItem in
                        if let description = termDictionary[transcriptItem.text] {
                            TermView(
                                isPlaying: Binding(
                                    get: { playingItemId == transcriptItem.id },
                                    set: { isPlaying in
                                        playingItemId = isPlaying ? transcriptItem.id : nil
                                    }
                                ),
                                term: transcriptItem.text,
                                description: description,
                                time: transcriptItem.start
                            )
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded {
                                        youtubeId.first?.seek(
                                            to: Measurement(value: transcriptItem.start, unit: UnitDuration.seconds),
                                            allowSeekAhead: true
                                        )
                                    }
                            )
                            .padding(.bottom, 8)
                            .padding(.horizontal, 16)
                        } else {
                            EmptyView()
                        }
                    }
                }
                .padding(.top, 16)
            } else {
                let filteredItems = currentTranscript.transcript.filter {
                    $0.text.lowercased().contains(searchText.lowercased())
                }
                
                // MARK: - 검색 결과가 없을 때
                
                if filteredItems .isEmpty && searchText != "" {
                    
                    Spacer()
                    
                    Text("검색 결과가 없어요!")
                        .font(.Body.body3)
                        .foregroundColor(.gray6)
                    
                    Spacer()
                    
                } else if !(filteredItems .isEmpty) {
                    // MARK: - 검색 결과 리스트
                    
                    ScrollView {
                        let filteredItems = currentTranscript.transcript.filter {
                            $0.text.lowercased().contains(searchText.lowercased())
                        }
                        
                        ForEach(filteredItems.sorted(by: { $0.start < $1.start}), id: \.id) { transcriptItem in
                            SearchResult(
                                isPlaying: $isPlaying,
                                searchText: transcriptItem.text,
                                time: transcriptItem.start
                            )
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded {
                                        youtubeId.first?.seek(
                                            to: Measurement(value: transcriptItem.start, unit: UnitDuration.seconds),
                                            allowSeekAhead: true
                                        )
                                    }
                            )
                            .padding(.bottom, 8)
                            .padding(.horizontal, 16)
                        }
                    }
                } else {
                    // MARK: - 검색 시 오버레이
                    
                    ZStack {
                        ScrollView {
                            ForEach(currentTranscript.transcript.sorted(by: { $0.start < $1.start }), id: \.id) { transcriptItem in
                                if let description = termDictionary[transcriptItem.text] {
                                    TermView(
                                        isPlaying: $isPlaying,
                                        term: transcriptItem.text,
                                        description: description,
                                        time: transcriptItem.start
                                    )
                                    .padding(.bottom, 8)
                                    .padding(.horizontal, 16)
                                } else {
                                    EmptyView()
                                }
                            }
                        }
                        .padding(.top, 16)
                        
                        Rectangle()
                            .background(.gray6)
                            .opacity(0.1)
                            .onTapGesture {
                                withAnimation {
                                    isSearchActive.toggle()
                                }
                            }
                    }
                }
            }
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
