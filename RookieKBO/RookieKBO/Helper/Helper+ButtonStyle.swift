//
//  Helper+ButtonStyle.swift
//  RookieKBO
//
//  Created by Simmons on 11/26/24.
//

import SwiftUI

struct AnimatedButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
