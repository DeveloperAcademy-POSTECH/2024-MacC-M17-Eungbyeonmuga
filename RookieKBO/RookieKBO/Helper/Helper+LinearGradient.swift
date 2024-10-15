//
//  Helper+LinearGradient.swift
//  RookieKBO
//
//  Created by Simmons on 10/9/24.
//

import SwiftUI

extension LinearGradient {
    static func gradient(startColor: Color, endColor: Color) -> LinearGradient {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: startColor, location: 0.0),
                .init(color: endColor, location: 1.0)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
