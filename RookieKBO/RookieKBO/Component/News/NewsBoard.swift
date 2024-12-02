//
//  NewsBoard.swift
//  RookieKBO
//
//  Created by Simmons on 11/16/24.
//

import SwiftUI

struct NewsBoard: View {
    
    let newsInfo: News
    let tapAction: () -> Void
    
    var body: some View {
        ScalableButton {
            tapAction()
        } label: {
            ZStack {
                VStack(spacing: 0) {
                    if let highQualityUrl = highQualityImageUrl(from: newsInfo.imageUrl),
                       let url = URL(string: highQualityUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 208)
                            
                        } placeholder: {
                            ProgressView()
                                .frame(height: 208)
                        }
                    } else {
                        // 기본 플레이스홀더
                        Color.gray
                            .frame(height: 208)
                    }
                }
                VStack(spacing: 0) {
                    Spacer()
                    
                    Text(newsInfo.title.forceCharWrapping)
                        .font(.Body.body2)
                        .foregroundColor(.gray7)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(12)
                        .background(.white0)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .frame(height: 208)
        }
    }

    
    private func highQualityImageUrl(from urlString: String) -> String? {
        guard let url = URL(string: urlString) else { return nil }
        let highQualityPath = urlString.replacingOccurrences(of: "/l_", with: "/c_")
        return highQualityPath
    }
}

#Preview {
    NewsBoard(newsInfo: MockDataBuilder.mockNews) {
        print("tapped")
    }
}
