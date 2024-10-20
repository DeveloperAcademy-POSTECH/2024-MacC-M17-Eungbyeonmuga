//
//  CurrentGameView.swift
//  RookieKBO
//
//  Created by Simmons on 10/17/24.
//

import SwiftUI

struct CurrentGameView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
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
            if !playingGames.isEmpty {
                HStack(spacing: 0) {
                    GameStateLabel(gameState: GameStateLabel.GameState.playing)
                    Spacer()
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
            
            
            VStack(spacing: 16) {
                ForEach(playingGames, id: \.id) { game in
                    PlayingGameInfo(playingGameInfo: game)
                }
            }
            
            if !prepareGames.isEmpty {
                HStack(spacing: 0) {
                    GameStateLabel(gameState: GameStateLabel.GameState.preparing)
                    Spacer()
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
            
            VStack(spacing: 16) {
                ForEach(prepareGames, id: \.id) { game in
                    PreparingGameInfo(preparingGameInfo: game)
                }
            }
            
            if !endGames.isEmpty {
                HStack(spacing: 0) {
                    GameStateLabel(gameState: GameStateLabel.GameState.end)
                    Spacer()
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
            
            VStack(spacing: 16) {
                ForEach(endGames, id: \.id) { game in
                    EndGameInfo(endGameInfo: game)
                }
            }
            
            if !cancelGames.isEmpty {
                HStack(spacing: 0) {
                    GameStateLabel(gameState: GameStateLabel.GameState.cancel)
                    Spacer()
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
            
            VStack(spacing: 16) {
                ForEach(cancelGames, id: \.id) { game in
                    CancelGameInfo(cancelGameInfo: game)
                }
            }
        }
    }
}

#Preview {
    CurrentGameView(games: MockDataBuilder.mockMatchList)
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
        .environment(PathModel())
        .environment(PreviewHelper.mockMatchUseCase)
}
