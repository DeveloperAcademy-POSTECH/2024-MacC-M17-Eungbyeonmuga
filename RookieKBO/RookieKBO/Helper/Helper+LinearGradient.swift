//
//  Helper+LinearGradient.swift
//  RookieKBO
//
//  Created by Simmons on 10/9/24.
//

import SwiftUI

extension LinearGradient {
    static var primaryGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color.primaryColor1, location: 0.0),
                .init(color: Color.primaryColor2, location: 1.0)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
