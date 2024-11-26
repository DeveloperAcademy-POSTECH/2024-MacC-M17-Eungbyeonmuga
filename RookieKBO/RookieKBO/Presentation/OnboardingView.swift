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
    @State private var currentImageIndex: Int = 0
    
    let bubbleScript = ["환영합니다!", "응원하는 팀을 선택해요", "우리 팀 기준의 경기 정보를 확인해요", "위젯으로 간편하게 확인해요", "하이라이트 영상과 함께 용어를 학습해요"]
    let onboardingImage = ["onboarding1", "onboarding2", "onboarding3", "onboarding4", "onboarding5"]
    
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
                .padding(.top, -8)
                
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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(0..<onboardingImage.count, id: \.self) { index in
                            VStack(alignment: .center, spacing: 0) {
                                ZStack {
                                    Image(systemName: "bubble.middle.bottom.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 42)
                                        .foregroundColor(.white0)
                                    
                                    VStack(spacing: 0) {
                                        Text(bubbleScript[index])
                                            .animation(.none)
                                            .font(.Body.body1)
                                            .foregroundColor(.gray7)
                                            .padding(.horizontal, 20)
                                            .frame(height: 36)
                                            .background(RoundedRectangle(cornerRadius: 10)
                                                .fill(.white0))
                                        
                                        Spacer(minLength: 0)
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width, height: 42)
                                .padding(.vertical, 24)
                                
                                Image(onboardingImage[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 223)
                            }
                        }
                    }
                    .offset(x: CGFloat(currentImageIndex) * -(UIScreen.main.bounds.width))
                    .animation(.easeInOut(duration: 0.8), value: currentImageIndex)
                }
                .disabled(true)
                
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
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        processGauge -= 0.2
                                    }
                                    currentImageIndex -= 1
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        isAnimating = false
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
                            
                            Spacer(minLength: 0)
                            
                            Button {
                                if !isAnimating {
                                    isAnimating = true
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        processGauge += 0.2
                                    }
                                    currentImageIndex += 1
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        isAnimating = false
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
