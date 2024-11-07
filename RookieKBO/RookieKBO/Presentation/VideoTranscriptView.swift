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
    
    // 실제 데이터로 변경
    let currentTranscript = MockTermBuilder.mockTranscript
    
    var youtubeId = [
        YouTubePlayer(stringLiteral: "https://www.youtube.com/watch?v=uaK6e95za0w")
    ]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TopView()
            
            YouTubePlayerView(youtubeId.first ?? "")
                .frame(height: 220)
            
            TermRow()
                .padding(.bottom, 16)
            
            ScrollView {
                ForEach(currentTranscript.transcript, id: \.start) { transcriptItem in
                    if let description = termDictionary[transcriptItem.text] {
                        TermView(term: transcriptItem.text, description: description, time: transcriptItem.start)
                            .padding(.bottom, 8)
                            .padding(.horizontal, 16)
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
}

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


#Preview {
    VideoTranscriptView()
        .environment(PreviewHelper.mockTermUseCase)
}
