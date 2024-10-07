import SwiftUI

struct ScoreBoardView: View {
    
    enum Inning {
        case nine
        case ten
        case eleven
        case twelve
    }
    
    let match: Match
    let inning: Inning
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            InningInfo(inning: inning)
            TeamBoard(inning: inning, match: match, isHomeTeam: true)
            TeamBoard(inning: inning, match: match, isHomeTeam: false)
        }
    }
}

private struct InningInfo: View {
    let inning: ScoreBoardView.Inning
    
    var body: some View {
        HStack(spacing: 0) {
            Text("팀명")
                .frame(width: 24)
                .font(.Caption.caption2)
                .padding(.trailing, 8)
            
            ForEach(1...inningCount, id: \.self) { inningNumber in
                Text("\(inningNumber)")
                    .font(.Caption.caption2)
                    .frame(width: 5)
            }
            .padding(.trailing, trailingPadding)
            
            Text("R")
                .font(.Caption.caption2)
                .padding(.trailing, trailingPadding)
            Text("H")
                .font(.Caption.caption2)
                .padding(.trailing, trailingPadding)
            Text("E")
                .font(.Caption.caption2)
                .padding(.trailing, trailingPadding)
            Text("B")
                .font(.Caption.caption2)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 16)
        .background(Color.red)
        .cornerRadius(99)
    }
    
    private var inningCount: Int {
        switch inning {
        case .nine:
            return 9
        case .ten:
            return 10
        case .eleven:
            return 11
        case .twelve:
            return 12
        }
    }
    
    private var trailingPadding: CGFloat {
        switch inning {
        case .nine:
            return 15
        case .ten:
            return 13
        case .eleven:
            return 12
        case .twelve:
            return 10
        }
    }
}

private struct TeamBoard: View {
    
    let inning: ScoreBoardView.Inning
    let match: Match
    let isHomeTeam: Bool
    
    private var scoreBoard: [ScoreBoard] {
        match.scoreBoard?.filter { $0.homeAndAway == (isHomeTeam ? .HOME : .AWAY) } ?? []
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(isHomeTeam ? match.homeTeam.name : match.awayTeam.name)
                .frame(width: 24)
                .font(.Caption.caption2)
                .padding(.trailing, 8)
            
            ForEach(scoreBoard, id: \.id) { score in
                HStack(spacing: paddingAmount) {
                    ForEach(score.scores, id: \.self) { scoreValue in
                        Text("\(scoreValue)")
                            .font(.Caption.caption2)
                            .frame(width: 7)
                    }
                }
                .padding(.trailing, paddingAmount)
            }
            
            if let firstScoreBoard = scoreBoard.first {
                Text("\(firstScoreBoard.runs)")
                    .font(.Caption.caption2)
                    .padding(.trailing, paddingAmount)
                
                Text("\(firstScoreBoard.hits)")
                    .font(.Caption.caption2)
                    .padding(.trailing, paddingAmount)
                
                Text("\(firstScoreBoard.errors)")
                    .font(.Caption.caption2)
                    .padding(.trailing, paddingAmount)
                
                Text("\(firstScoreBoard.balls)")
                    .font(.Caption.caption2)
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 16)
    }
    
    private var paddingAmount: CGFloat {
        switch inning {
        case .nine:
            return 14
        case .ten:
            return 12
        case .eleven:
            return 11
        case .twelve:
            return 9
        }
    }
}

#Preview {
    ScoreBoardView(match: Match(
        startDateTime: Date(),
        state: State.CANCEL,
        homeTeam: Team(name: "SSG", image: " "),
        awayTeam: Team(name: "KIA", image: " "),
        place: "인천 SSG 랜더스 필드",
        scoreBoard: [
            ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 5, scores: [1, 1, 1, 0, 0, 0, 0, 0, 0]),
            ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 0, 0])
        ]
    ), inning: .nine)
}
