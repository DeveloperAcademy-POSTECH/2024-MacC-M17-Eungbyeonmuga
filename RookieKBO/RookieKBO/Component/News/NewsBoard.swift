//
//  NewsBoard.swift
//  RookieKBO
//
//  Created by Simmons on 11/16/24.
//

import SwiftUI

struct NewsBoard: View {
    
    let newsInfo: News
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: newsInfo.imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                } placeholder: {
                    ProgressView()
                }
                
                Spacer(minLength: 0)
            }
            VStack(spacing: 0) {
                Spacer()
                
                Text(newsInfo.title)
                    .font(.Body.body2)
                    .foregroundColor(.gray7)
                    .lineLimit(2)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(.white0)
            }
        }
        .frame(height: 208)
    }
}

#Preview {
    NewsBoard(newsInfo: MockDataBuilder.mockNews)
}
