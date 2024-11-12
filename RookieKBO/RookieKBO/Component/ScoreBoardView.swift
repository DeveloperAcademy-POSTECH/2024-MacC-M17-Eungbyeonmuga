import SwiftUI

struct ScoreBoardView: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    enum Inning: Int {
        case nine = 9
        case ten = 10
        case eleven = 11
        case twelve = 12
        case thirteen = 13
        case fourteen = 14
        case fifteen = 15
    }
    
    var inning: Inning {
        let maxScoresCount = match.scoreBoard?.map { $0.scores.count }.max() ?? 0
        
        switch maxScoresCount {
        case 0...9:
            return .nine
        case 10:
            return .ten
        case 11:
            return .eleven
        case 12:
            return .twelve
        case 13:
            return .thirteen
        case 14:
            return .fourteen
        case 15:
            return .fifteen
        default:
            return .nine
        }
    }
    
    let match: Match
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            InningInfo(inning: inning)
            TeamBoard(inning: inning, match: match, isHomeTeam: false)
            TeamBoard(inning: inning, match: match, isHomeTeam: true)
        }
        .background(.gray2)
    }
}

// MARK: - InningInfo

private struct InningInfo: View {
    let inning: ScoreBoardView.Inning
    
    var body: some View {
        HStack(spacing: 0) {
            Text("팀명")
                .frame(width: 24)
                .font(.Caption.caption2)
                .foregroundColor(.gray5)
                .padding(.trailing, 8)
            
            ForEach(1...inningCount, id: \.self) { inningNumber in
                Text("\(inningNumber)")
                    .font(.Caption.caption2)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.gray5)
            }
            .padding(.trailing, trailingPadding)
            
            Text("R")
                .font(.Caption.caption2)
                .foregroundColor(.gray5)
                .frame(maxWidth: .infinity)
                .padding(.trailing, trailingPadding)
            
            Text("H")
                .font(.Caption.caption2)
                .foregroundColor(.gray5)
                .frame(maxWidth: .infinity)
                .padding(.trailing, trailingPadding)
            
            Text("E")
                .font(.Caption.caption2)
                .foregroundColor(.gray5)
                .frame(maxWidth: .infinity)
                .padding(.trailing, trailingPadding)
            
            Text("B")
                .font(.Caption.caption2)
                .foregroundColor(.gray5)
                .frame(maxWidth: .infinity)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 16)
        .background(.white0)
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
        case .thirteen:
            return 13
        case .fourteen:
            return 14
        case .fifteen:
            return 15
        }
    }
    
    private var trailingPadding: CGFloat {
        switch inning {
        case .nine:
            return 8
        case .ten:
            return 6
        case .eleven:
            return 5
        case .twelve:
            return 3
        case .thirteen:
            return 2
        case .fourteen:
            return 1
        case .fifteen:
            return 0
        }
    }
}

// MARK: - TeamBoard

private struct TeamBoard: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    
    let inning: ScoreBoardView.Inning
    let match: Match
    let isHomeTeam: Bool
    
    private var scoreBoard: [ScoreBoard] {
        match.scoreBoard?.filter { $0.homeAndAway == (isHomeTeam ? .HOME : .AWAY) } ?? []
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(isHomeTeam ? match.homeTeam.name.firstWord() : match.awayTeam.name.firstWord())
                .frame(width: 24)
                .font(.Caption.caption2)
                .foregroundColor(.gray7)
                .padding(.trailing, 8)
            
            ForEach(scoreBoard, id: \.id) { score in
                let adjustedScores =
                matchUseCase.adjustScores(score.scores, inning: inning)
                ForEach(adjustedScores, id: \.self) { scoreValue in
                    Text(scoreValue)
                        .font(.Caption.caption2)
                        .foregroundColor(.gray7)
                        .frame(maxWidth: .infinity)
                }
                .padding(.trailing, paddingAmount)
            }
            
            if let firstScoreBoard = scoreBoard.first {
                Text("\(firstScoreBoard.runs)")
                    .font(.Caption.caption2)
                    .foregroundColor(.gray7)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, paddingAmount)
                
                Text("\(firstScoreBoard.hits)")
                    .font(.Caption.caption2)
                    .foregroundColor(.gray7)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, paddingAmount)
                
                Text("\(firstScoreBoard.errors)")
                    .font(.Caption.caption2)
                    .foregroundColor(.gray7)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, paddingAmount)
                
                Text("\(firstScoreBoard.balls)")
                    .font(.Caption.caption2)
                    .foregroundColor(.gray7)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 16)
    }
    
    private var paddingAmount: CGFloat {
        switch inning {
        case .nine:
            return 8
        case .ten:
            return 6
        case .eleven:
            return 5
        case .twelve:
            return 3
        case .thirteen:
            return 2
        case .fourteen:
            return 1
        case .fifteen:
            return 0
        }
    }
}

#Preview {
    ScoreBoardView(match: MockDataBuilder.mockMatch)
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(PreviewHelperForWidget.mockMatchUseCase)
}
