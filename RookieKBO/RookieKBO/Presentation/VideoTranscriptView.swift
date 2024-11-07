//
//  VideoTranscriptView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/6/24.
//

import SwiftUI
import YouTubePlayerKit

struct VideoTranscriptView: View {
    
    var youtubeId = [
        YouTubePlayer(stringLiteral: "https://www.youtube.com/watch?v=uaK6e95za0w")
    ]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            YouTubePlayerView(youtubeId.first ?? "")
                .frame(height: 220)
            
            TermRow()
                .padding(.bottom, 16)
            
            TermView()
            
        }
    }
}

private struct TermRow: View {
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "baseball")
                .padding(.trailing, 4)
            
            
            Text("루키를 위한 야구 용어")
            
            Spacer()
            
            HStack(spacing: 8) {
                Text("키워드 검색")
                
                Image(.iconSearch)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(99)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(Color.gray)
    }
}


#Preview {
    VideoTranscriptView()
}
