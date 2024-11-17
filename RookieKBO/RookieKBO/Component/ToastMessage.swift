//
//  ToastMessage.swift
//  RookieKBO
//
//  Created by crownjoe on 11/12/24.
//

import SwiftUI

struct ToastMessage: View {

    let message: String
    
    @State private var opacity: CGFloat = 0
    @Binding private(set) var isToastPresented: Bool
    
    var body: some View {
        
        Text(message)
            .foregroundStyle(.white)
            .font(.Body.body1)
        
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(.black70)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .opacity(opacity)
        .onChange(of: isToastPresented) { _, flag in
            if flag { toggleToast() }
        }
    }
    
    private func toggleToast() {
        withAnimation(.easeInOut) {
            opacity = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut) {
                    opacity = 0
                    isToastPresented = false
                }
            }
        }
    }
}

#Preview {
    ToastMessage(
        message: "‘용어A' 삭제되었어요.",
        isToastPresented: .constant(false)
    )
}
