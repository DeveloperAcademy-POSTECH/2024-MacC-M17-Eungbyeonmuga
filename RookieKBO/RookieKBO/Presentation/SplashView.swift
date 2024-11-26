//
//  SplashView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/26/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            LottieAnimationView(lottieName: "rookiebase", lottieSpeed: 1.5)
            
            Spacer()
                .frame(height: 80)
        }
        .background(.brandPrimary)
    }
}

#Preview {
    SplashView()
}
