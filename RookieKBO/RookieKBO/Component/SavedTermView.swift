//
//  SavedTermView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/12/24.
//

import SwiftUI

struct SavedTermView: View {
    @Binding var isSaved: Bool
    
    var term: String
    var description: String
    
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
                
                Spacer()
                
                Group {
                    isSaved ?
                    Image(.iconFullbookmark) :
                    Image(.iconBookmark)
                }
                .onTapGesture {
                    isSaved.toggle()
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
                .stroke( Color.gray2, lineWidth: 2)
        )
    }
}

#Preview {
    SavedTermView(isSaved: .constant(true),
                  term: "백투백 홈런",
                  description: "어쩌고")
}
