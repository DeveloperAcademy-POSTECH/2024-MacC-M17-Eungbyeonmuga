//
//  TermRow.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import SwiftUI

struct TermRow: View {
    
    @Binding var isPlaying: Bool
    @Binding var isSaved: Bool
    
    var term: String
    var description: String
    var time: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(spacing: 0) {
                Text(term)
                    .font(.Head.head4b)
                    .foregroundColor(.gray7)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.brandPrimaryGd)
                    .cornerRadius(8)
                    .padding(.trailing, 8)
                
                Text("\(time.toTimeFormat())")
                    .font(.Body.body5)
                    .foregroundColor(.gray5)
                
                Spacer()
                
                ScalableButton {
                    isSaved.toggle()
                } label: {
                    Image(isSaved ? .iconFullbookmark : .iconBookmark)
                        .padding(.leading, 8)
                }
            }
            Text(description.forceCharWrapping)
                .font(.Body.body2)
                .foregroundColor(.gray7)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(nil)
        }
        .padding(.all, 16)
        .background(.white0)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isPlaying ? Color.brandPrimaryGd : Color.gray2, lineWidth: 2)
        )
        .padding(.top, 8)
    }
}

#Preview {
    TermRow(
        isPlaying: .constant(true),
        isSaved: .constant(true),
        term: "백투백 홈런",
        description: "어쩌고 저쩌고어쩌고어쩌고 저쩌고 저쩌고어쩌고 저쩌고어어쩌어쩌고 저쩌고고 저쩌고쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고",
        time: 13.0
    )
}
