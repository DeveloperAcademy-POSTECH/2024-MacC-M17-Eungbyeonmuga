//
//  TermRow.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import SwiftUI

struct TermView: View {
    @Environment(TermUseCase.self) private var termUseCase
    
    @State private var isPlaying: Bool = false
    @State private var isSaved: Bool = false
    
    var term: String
    
    var body: some View {
        VStack(spacing: 18) {
            HStack(spacing: 0) {
                Text(term)
                    .font(.Head.head4b)
                    .foregroundColor(.gray7)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.brandPrimaryGd)
                    .cornerRadius(8)
                    .padding(.trailing, 8)
                
                Text("0:30")
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
                    if isSaved {
                        termUseCase.createTermEntry(term: term)  // 용어 저장
                    } else {
                        termUseCase.deleteTermEntry(term: term)  // 용어 삭제
                    }
                    termUseCase.printTermEntries()  // 로그로 확인
                }
            }
            Text("용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻용어뜻")
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
    }
}

#Preview {
    TermView(term: "백투백 홈런")
        .environment(PreviewHelper.mockTermUseCase)
}
