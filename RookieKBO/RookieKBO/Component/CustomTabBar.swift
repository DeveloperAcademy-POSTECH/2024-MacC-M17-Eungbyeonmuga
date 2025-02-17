//
//  CustomTabBar.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

// MARK: - CustomTabBar Component

struct CustomTabBar: View {
    
    let tab: GameTab
    let teamColor: Color
    let onTabSelected: (GameTab) -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            Spacer()
            
            // 이전 경기 버튼
            TabButton(
                title: "이전 경기",
                color: teamColor,
                isSelected: tab == .beforeList,
                tapAction: {
                    onTabSelected(.beforeList)
                }
            )
            
            // 오늘 경기 버튼
            TabButton(
                title: "오늘 경기",
                color: teamColor,
                isSelected: tab == .currentList,
                tapAction: {
                    onTabSelected(.currentList)
                }
            )
            
            // 다음 경기 버튼
            TabButton(
                title: "다음 경기",
                color: teamColor,
                isSelected: tab == .upcomingList,
                tapAction: {
                    onTabSelected(.upcomingList)
                }
            )
            
            Spacer()
        }
    }
}

// MARK: - TabButton Component

struct TabButton: View {
    
    let title: String
    let color: Color
    let isSelected: Bool
    let tapAction: () -> Void
    
    var body: some View {
        Button(action: {
            tapAction()
        }) {
            Text(title)
                .font(.Head.head4)
                .foregroundColor(isSelected ? color : .gray6)
                .frame(width: 75, height: 20)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(RoundedRectangle(cornerRadius: 99)
                    .fill(Color.clear)
                    .overlay(
                        Group {
                            if color == .brandPrimary {
                                if isSelected {
                                    RoundedRectangle(cornerRadius: 99)
                                        .stroke(LinearGradient.gradient(startColor: .brandPrimary, endColor: .brandPrimaryGd), lineWidth: 2)
                                } else {
                                    RoundedRectangle(cornerRadius: 99)
                                        .stroke(Color.clear, lineWidth: 2)
                                }
                            }
                            else {
                                if isSelected {
                                    RoundedRectangle(cornerRadius: 99)
                                        .stroke(color, lineWidth: 2)
                                } else {
                                    RoundedRectangle(cornerRadius: 99)
                                        .stroke(Color.clear, lineWidth: 2)
                                }
                            }
                            
                        }
                    )
                )
        }
    }
}

enum GameTab {
    case beforeList // 이전 경기
    case currentList // 오늘 경기
    case upcomingList // 다음 경기
}

#Preview {
    CustomTabBar(
        tab: .beforeList,
        teamColor: .brandPrimary,
        onTabSelected: { selectedTab in
            print("Selected tab: \(selectedTab)")
        }
    )
}
