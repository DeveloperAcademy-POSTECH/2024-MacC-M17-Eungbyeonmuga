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
        Button {
            tapAction()
        } label: {
            ZStack {
                VStack(spacing: 0) {
                    AsyncImage(url: URL(string: newsInfo.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 208)
                    } placeholder: {
                        ProgressView()
                            .frame(height: 208)
                    }
                }
                VStack(spacing: 0) {
                    Spacer()
                    
                    Text(newsInfo.title.forceCharWrapping)
                        .font(.Body.body2)
                        .foregroundColor(.gray7)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(.white0)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .frame(height: 208)
        }
    }
}

#Preview {
    NewsBoard(newsInfo: MockDataBuilder.mockNews) {
        print("tapped")
    }
}
