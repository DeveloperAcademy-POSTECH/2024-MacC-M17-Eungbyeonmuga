//
//  TermRow.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import SwiftUI

struct TermView: View {
    var body: some View {
        VStack(spacing: 18) {
            HStack(spacing: 0) {
                Text("용어 A")
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.Brand.primaryGd)
                    .cornerRadius(8)
                    .padding(.trailing, 8)
                
                Text("0:30")
                
                Spacer()
                
                Image(.iconBookmark)
                    .onTapGesture {
                        //액션
                    }
                
            }
            Text("용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻")
        }
        .padding(.all, 16)
        .background(Color.ScoreBoardColor.scoreBoardBg)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 2)
        )
    }
}

#Preview {
    TermView()
}
