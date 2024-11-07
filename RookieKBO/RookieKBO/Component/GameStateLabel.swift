//
//  GameStateLabel.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/18/24.
//

import SwiftUI

struct GameStateLabel: View {
    
    enum GameState: String {
        case preparing = "예정"
        case playing = "진행 중"
        case end = "종료"
        case cancel = "취소"
    }
    
    let gameState: GameState
    
    var body: some View {
        Text(gameState.rawValue)
            .font(.Body.body2)
            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
            .foregroundStyle(gameState == GameState.playing ? Color.white : Color.black)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(gameState == GameState.playing ? .brandPrimary : Color.gray2)
            }
    }
}

#Preview {
    GameStateLabel(gameState: GameStateLabel.GameState.playing)
}
