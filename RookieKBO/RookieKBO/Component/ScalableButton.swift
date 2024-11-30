//
//  ScalableButton.swift
//  RookieKBO
//
//  Created by Simmons on 11/26/24.
//

import SwiftUI

struct ScalableButton<Label: View>: View {
    let action: () -> Void
    let label: () -> Label
    
    @State private var scaleValue: CGFloat = 1.0

    var body: some View {
        Button {
            withAnimation(.easeIn(duration: 0.1)) {
                scaleValue = 0.9
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    scaleValue = 1.0
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
                action()
            }
        } label: {
            label()
                .scaleEffect(scaleValue)
        }
        .buttonStyle(AnimatedButtonStyle())
    }
}
