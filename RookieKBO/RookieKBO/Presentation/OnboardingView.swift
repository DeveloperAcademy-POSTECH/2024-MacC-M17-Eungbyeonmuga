//
//  OnboardingView.swift
//  RookieKBO
//
//  Created by Simmons on 11/25/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var processGauge: Double = 0.2
    @State private var isAnimating: Bool = false
    @State private var isTextVisible: Bool = true
    @State private var textScale: CGFloat = 1.0
    
    let bubbleScript = ["환영합니다!", "응원하는 팀을 선택해요", "우리 팀 기준의 경기 정보를 확인해요", "위젯으로 간편하게 확인해요", "하이라이트 영상과 함께 용어를 학습해요"]
    
    var body: some View {
        ZStack {
            Color.brandPrimaryGd
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white0)
                        .frame(height: 32)
                    
                    
                    HStack(spacing: 0) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(LinearGradient.gradient(startColor: .brandPrimary, endColor: .brandPrimaryGd))
                            .frame(width: UIScreen.main.bounds.width * processGauge * 0.75, height: 16)
                            .animation(.easeInOut(duration: 1.0), value: processGauge)
                            .padding(8)
                        
                        Spacer(minLength: 0)
                        
                        Text("\(Int(processGauge * 5)) / 5")
                            .font(.Body.body4)
                            .padding(.trailing)
                    }
                }
                .padding()
                
                HStack(spacing: 0) {
                    Spacer()
                    
                    Button {
                        // TODO: 온보딩 스킵
                    } label: {
                        Text("skip")
                            .font(.Head.head5)
                            .foregroundColor(.white0)
                    }
                }
                .padding(.trailing)
                
                ZStack {
//                    Image(systemName: "bubble.middle.bottom.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 42)
//                        .foregroundColor(.white0)
//                        .scaleEffect(textScale)
//                        .opacity(isTextVisible ? 1.0 : 0.0)
//                        .animation(.easeInOut(duration: 0.5), value: textScale)
//                        .animation(.easeInOut(duration: 0.5), value: isTextVisible)
                    
                    VStack(spacing: 0){
                        Text(bubbleScript[(Int(processGauge * 5) - 1)])
                            .animation(.none)
                            .font(.Body.body1)
                            .foregroundColor(.gray7)
                            .padding(.horizontal, 20)
                            .frame(height: 36)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(.white0))
                            .scaleEffect(textScale)
                            .opacity(isTextVisible ? 1.0 : 0.0)
                            .animation(.easeInOut(duration: 0.5), value: textScale)
                            .animation(.easeInOut(duration: 0.5), value: isTextVisible)
                        
                        
                        Spacer(minLength: 0)
                    }
                }
                .frame(height: 42)
                .padding(24)
                
                Image("onboarding1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 223)
                
                Spacer()
            }
            
            VStack(spacing: 0) {
                
                Spacer()
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("루키베이스")
                                .font(.CustomTitle.customTitle2)
                                .foregroundColor(.gray7)
                            
                            Text("한국 야구 뉴비 팬들을 위한 야구 선배\n루키베이스를 소개합니다")
                                .font(.Head.head4)
                                .foregroundColor(.gray7)
                        }
                        .padding(32)
                        
                        Spacer()
                    }
                    
                    ZStack {
                        HStack(spacing: 0) {
                            Button {
                                if !isAnimating {
                                    isAnimating = true
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        textScale = 0.5
                                        isTextVisible = false
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        processGauge -= 0.2
                                        textScale = 1.2
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            textScale = 1.0
                                            isAnimating = false
                                            isTextVisible = true
                                        }
                                    }
                                }
                            } label: {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white0)
                                    .frame(width: 22, height: 22)
                                    .background(Circle()
                                        .fill(processGauge > 0.21 ? .brandPrimaryGd : .clear)
                                        .scaledToFit()
                                        .frame(width: 54, height: 54))
                                    .padding()
                            }
                            .padding(.leading)
                            .disabled(isAnimating)
                            
                            Spacer()
                        }
                        
                        HStack(spacing: 0) {
                            
                            Spacer()
                            
                            Button {
                                if !isAnimating {
                                    isAnimating = true
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        textScale = 0.5
                                        isTextVisible = false
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        textScale = 1.2
                                        processGauge += 0.2
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            textScale = 1.0
                                            isAnimating = false
                                            isTextVisible = true
                                        }
                                    }
                                }
                            } label: {
                                Text("다음")
                                    .font(.Head.head3)
                                    .foregroundColor(.white0)
                                    .frame(width: processGauge > 0.21 ? 291 : 361, height: 54)
                                    .background(RoundedRectangle(cornerRadius: 16)
                                        .fill(.brandPrimary)
                                    )
                            }
                            .padding()
                            .disabled(isAnimating)
                        }
                    }
                }
                .background(.white0)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
