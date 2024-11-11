//
//  TermRow.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import SwiftUI

struct TermView: View {
    @Environment(TermUseCase.self) private var termUseCase
    
//    @State private var isSaved: Bool = false
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
                
                Group {
                    isSaved ?
                    Image(.iconFullbookmark) :
                    Image(.iconBookmark)
                }
                .onTapGesture {
                    isSaved.toggle()
//                    if isSaved {
//                        termUseCase.createTermEntry(term: term)
//                    } else {
//                        termUseCase.deleteTermEntry(term: term)
//                    }
//                    termUseCase.printTermEntries()
                }
            }
            Text(description)
                .font(.Body.body2)
                .foregroundColor(.gray7)
        }
        .padding(.all, 16)
        .background(.white0)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isPlaying ? Color.brandPrimaryGd : Color.gray2, lineWidth: 2)
        )
        .onTapGesture {
            isPlaying.toggle()
        }
    }
}

#Preview {
    TermView(
        isPlaying: .constant(true),
        isSaved: .constant(true),
        term: "백투백 홈런",
        description: "어쩌고 저쩌고어쩌고어쩌고 저쩌고 저쩌고어쩌고 저쩌고어어쩌어쩌고 저쩌고고 저쩌고쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고",
        time: 13.0
    )
    .environment(PreviewHelper.mockTermUseCase)
}
