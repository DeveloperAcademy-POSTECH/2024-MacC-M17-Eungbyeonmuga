//
//  CurrentGameView.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

struct CurrentGameView: View {
    
    let games: [Match]
    
    var prepareGames: [Match] {
        return games.filter { game in
            return game.gameState == .PREPARE
        }
    }
    
    var playingGames: [Match] {
        return games.filter { game in
            return game.gameState == .PLAYING
        }
    }
    
    var endGames: [Match] {
        return games.filter { game in
            return game.gameState == .END
        }
    }
    
    var cancelGames: [Match] {
        return games.filter { game in
            return game.gameState == .CANCEL
        }
    }
    
    var body: some View {
        ScrollView {
            HStack(spacing: 0) {
                GameStateLabel(gameState: GameStateLabel.GameState.playing)
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
            VStack(spacing: 16) {
                ForEach(playingGames) { game in
                    PlayingGameInfo(playingGameInfo: game)
                }
            }
            
            HStack(spacing: 0) {
                GameStateLabel(gameState: GameStateLabel.GameState.preparing)
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
            VStack(spacing: 16) {
                ForEach(prepareGames) { game in
                    PreparingGameInfo(preparingGameInfo: game)
                }
            }
            
            HStack(spacing: 0) {
                GameStateLabel(gameState: GameStateLabel.GameState.end)
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
            VStack(spacing: 16) {
                ForEach(endGames) { game in
                    EndGameInfo(endGameInfo: game)
                }
            }
            
            HStack(spacing: 0) {
                GameStateLabel(gameState: GameStateLabel.GameState.cancel)
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
            VStack(spacing: 16) {
                ForEach(cancelGames) { game in
                    CancelGameInfo(cancelGameInfo: game)
                }
            }
        }
    }
}

#Preview {
    CurrentGameView(games: MockDataBuilder.mockMatchList)
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}
