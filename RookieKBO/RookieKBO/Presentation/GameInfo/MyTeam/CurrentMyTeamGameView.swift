//
//  CurrentMyTeamGameView.swift
//  RookieKBO
//
//  Created by kyungsoolee on 10/20/24.
//

import SwiftUI

struct CurrentMyTeamGameView: View {
    
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
            VStack(spacing: 16) {
                ForEach(playingGames, id: \.id) { game in
                    MyTeamPlayingGameInfo(playingGameInfo: game)
                }
            }
            
            VStack(spacing: 16) {
                ForEach(prepareGames, id: \.id) { game in
                    MyTeamPreParingGameInfo(preparingGameInfo: game)
                }
            }
            
            VStack(spacing: 16) {
                ForEach(endGames, id: \.id) { game in
                    MyTeamEndGameInfo(endGameInfo: game)
                }
            }
            
            VStack(spacing: 16) {
                ForEach(cancelGames, id: \.id) { game in
                    MyTeamCancelGameInfo(cancelGameInfo: game)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CurrentMyTeamGameView(games: MockDataBuilderForWidget.mockMatchList)
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(SelectTeamUseCase(selectTeamService: StubSelectTeamService()))
        .environment(PathModel())
        .environment(PreviewHelperForWidget.mockMatchUseCase)
}
