//
//  SearchResult.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import SwiftUI

struct SearchResult: View {
    
    @State private var isPlaying: Bool = false
    
    var searchText: String
    var time: Double
    
    var body: some View {
        HStack(spacing: 0) {
            Text(searchText)
                .font(.Head.head4b)
                .foregroundColor(.gray7)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(isPlaying ? Color.brandPrimaryGd : Color.wordbox)
                .cornerRadius(8)
                .padding(.trailing, 8)
            
            Text("\(time.toTimeFormat())")
                .font(.Body.body5)
                .foregroundColor(.gray5)
            
            Spacer()
        }
        .onTapGesture {
            isPlaying.toggle()
        }
        .padding(.all, 16)
        .background(.white0)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isPlaying ? Color.brandPrimaryGd : Color.gray2, lineWidth: 2)
        )
    }
}

#Preview {
    SearchResult(searchText: "박성한", time: 5.98)
}
