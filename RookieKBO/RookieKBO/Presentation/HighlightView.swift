//
//  HighlightView.swift
//  RookieKBO
//
//  Created by Simmons on 11/7/24.
//

import SwiftUI

struct HighlightView: View {
    let highlightContent = ["ssgBg", "ktBg", "ncBg", "lgBg"]
    
    var body: some View {
        ZStack {
            Color.brandPrimary
                .ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                    Section(header: HighlightHeader()) {
                        VStack {
                            HStack(spacing: 0) {
                                Text("영상을 보면서 야구 용어를 학습하거나\n좋아하는 선수를 찾아보세요!")
                                    .foregroundColor(.white0)
                                    .font(.Head.head4)
                                    .lineSpacing(6)
                                
                                Spacer()
                            }
                            .padding(.leading)
                            .padding(.bottom)
                        }
                        .background(.brandPrimary)
                        
                        ForEach(highlightContent, id: \.self) { name in
                            ListItem(video: name)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                        }
                        
                        Spacer()
                            .frame(height: 60)
                        
                    }
                }
                .background(.gray1)
            }
            .clipped()
        }
    }
}

struct HighlightHeader: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("하이라이트")
                    .foregroundColor(.white0)
                    .font(.CustomTitle.customTitle2)
                
                Spacer()
            }
            .padding()
        }
        .background(.brandPrimary)
    }
}

struct ListItem: View {
    let video: String
    
    var body: some View {
        ZStack {
            Image(video)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.black)
                .opacity(0.5)
            
            Text(video)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    HighlightView()
}
