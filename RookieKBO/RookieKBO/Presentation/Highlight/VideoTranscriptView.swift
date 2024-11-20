//
//  VideoTranscriptView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/6/24.
//

import SwiftUI
import YouTubePlayerKit
import SwiftData

struct VideoTranscriptView: View {
    
    @Environment(TermUseCase.self) private var termUseCase
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(HighlightUseCase.self) private var highlightUseCase
    @Environment(\.modelContext) var modelContext
    
    @Query var savedTermEntry: [TermEntry]
    
    @State private var searchText = ""
    @State private var playingItemId: UUID?
    @State private var isSearchActive = false
    @State private var isPlaying: Bool = false
    @State private var isSaved: Bool = false
    @State private var savedTerms: [String: Bool] = [:]
    @State private var currentPlaybackTime: TimeInterval = 0
    @State private var isShowToastMessage: Bool = false
    @State private var toastMessage: String = ""
    @State private var currentVideoId: String = ""
    
    @State private var youtubePlayer: YouTubePlayer
    
    init() {
        _youtubePlayer = State(initialValue: YouTubePlayer(
            source: .url(""),
            configuration: YouTubePlayer.Configuration(autoPlay: true)
        ))
    }
    
    private var currentTranscript: VideoTranscript? {
        if let videoTranscript = termUseCase.loadTranscript(from: highlightUseCase.state.selectedHighlight?.videoId ?? "") {
            return videoTranscript
        } else {
            print("자막 생성 실패")
            return nil
        }
    }
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    /// 재생될 때 업데이트 하는 함수
    private func updateIsPlaying(for time: TimeInterval) {
        guard let currentTranscript = currentTranscript else { return }
        
        let matchingItems = currentTranscript.transcript.filter { transcriptItem in
            abs(transcriptItem.start - time) <= 1.0
        }
        
        print("🎀🎀🎀",matchingItems)
        
        if let matchingItem = matchingItems.first {
            if let description = getTermDescription(for: matchingItem.text), !description.isEmpty {
                
                playingItemId = matchingItem.id
                print("🎀",playingItemId)
                isPlaying = true
            } else {
                isPlaying = false
            }
        } else {
            isPlaying = false
        }
    }
    
    /// 용어 삭제
    private func deleteTermEntry(term: String) {
        if let termToDelete = savedTermEntry.first(where: { $0.term == term }) {
            modelContext.delete(termToDelete)
            isShowToastMessage = true
            toastMessage = "'\(term)' 삭제되었어요."
            print("✅ \(term) 용어 삭제")
        } else {
            print("❌ 삭제할 용어를 찾을 수 없음")
        }
    }
    
    /// 용어 저장
    private func createTermEntry(term: String, definition: String) {
        if savedTermEntry.contains(where: { $0.term == term }) {
            print("⚠️ 이미 저장된 용어 \(term)")
            return
        }
        else {
            let newTermEntry = TermEntry(term: term, definition: definition)
            modelContext.insert(newTermEntry)
            isShowToastMessage = true
            toastMessage = "'\(term)' 추가되었어요."
            print("✅ \(term) 용어 추가")
        }
    }
    
    /// 용어 저장 여부 판단
    private func isTermSaved(term: String) -> Bool {
        return savedTermEntry.contains { $0.term == term }
    }
    
    /// 검색 결과로 뷰를 그리는 함수
    private func searchResultsView(_ items: [TranscriptItem]) -> some View {
        ScrollView {
            ForEach(items.sorted(by: { $0.start < $1.start }), id: \.id) { transcriptItem in
                SearchResultRow(
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
        ZStack {
            // 상단 배경
            Color(Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "") ?? .brandPrimary)
                .ignoresSafeArea(edges: .top)
            
            // 하단 배경
            Color.gray1
                .ignoresSafeArea(edges: .bottom)
                .offset(y: UIScreen.main.bounds.height / 3.5)
            
            VStack(spacing: 0) {
                TopView()
                
                YouTubePlayerView(youtubePlayer)
                    .frame(height: 220)
                
                if isSearchActive {
                    SearchBar(text: $searchText)
                } else {
                    TermInfoRow()
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
                if youtubePlayer.isPlaying {
                    youtubePlayer.getCurrentTime { result in
                        switch result {
                        case .success(let time):
                            currentPlaybackTime = time.value
                            updateIsPlaying(for: currentPlaybackTime)
                        case .failure(let error):
                            print("재생 시간 가져오는 에러다 짜식아 \(error.localizedDescription)")
                        }
                    }
                } else {
                    print("플레이어가 재생되지 않음")
                }
            }
            .onAppear {
                if let videoUrl = highlightUseCase.state.videoUrl {
                    youtubePlayer.source = .url(videoUrl)
                    youtubePlayer.play()
                }
            }
            
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - 검색 콘텐츠
    private var searchContent: some View {
        Group {
            if searchText.isEmpty {
                termContent
            } else {
                let filteredItems = currentTranscript?.transcript.filter {
                    $0.text.lowercased().contains(searchText.lowercased())
                }
                
                if filteredItems?.isEmpty == true {
                    noSearchResults
                } else {
                    searchResultsView(filteredItems ?? [])
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
                        Spacer()
                            .frame(height: 16)
                        
                        ForEach(currentTranscript?.transcript.sorted(by: { $0.start < $1.start }) ?? [], id: \.id) { transcriptItem in
                            if let description = getTermDescription(for: transcriptItem.text), !description.isEmpty {
                                let normalizedTerm = description.keys.first!
                                
                                let descriptionText = description[normalizedTerm]!
                                
                                let isTermSaved = isTermSaved(term: normalizedTerm)
                                
                                TermRow(
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
                                                createTermEntry(term: normalizedTerm, definition: descriptionText)
                                            } else {
                                                deleteTermEntry(term: normalizedTerm)
                                            }
                                        }
                                    ),
                                    term: normalizedTerm,
                                    description: descriptionText,
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
                
                VStack {
                    Spacer()
                    
                    ToastMessage(
                        message: toastMessage,
                        isToastPresented: $isShowToastMessage
                    )
                    .padding(.bottom, 35)
                }
                
                if isSearchActive {
                    Rectangle()
                        .foregroundColor(.gray6)
                        .opacity(0.3)
                        .onTapGesture {
                            withAnimation {
                                isSearchActive.toggle()
                            }
                        }
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
    
    
}

// MARK: - TopView

private struct TopView: View {
    
    @Environment(HighlightUseCase.self) private var highlightUseCase
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var body: some View {
        HStack(spacing: 0) {
            HStack(alignment: .lastTextBaseline, spacing: 0) {
                Text( highlightUseCase.state.selectedHighlight?.title ?? "")
                    .font(.CustomTitle.customTitle2)
                    .foregroundColor(.gray1)
                    .padding(.trailing, 16)
                
                Text(highlightUseCase.state.selectedHighlight?.date ?? "" .replacingOccurrences(of: "-", with: "."))
                    .font(.Body.body5)
                    .foregroundColor(.gray1)
            }
            
            Spacer()
            
            Image(systemName: "xmark")
                .font(.Head.head3)
                .foregroundStyle(.white0)
                .onTapGesture {
                    pathModel.pop()
                }
        }
        .padding()
        .background(Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? ""))
    }
}

// MARK: - TermInfoRow

private struct TermInfoRow: View {
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
        .environment(PathModel())
        .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
        .environment(HighlightUseCase(highlightService: HighlightServiceImpl()))
}
