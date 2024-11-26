//
//  LottieAnimationView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/26/24.
//

import SwiftUI
import Lottie

struct LottieAnimationView: View {
    
    let lottieName: String
    let lottieSpeed: Double
    
    var body: some View {
        LottieView(animation: .named(lottieName))
            .looping()
            .animationSpeed(lottieSpeed)
    }
}
