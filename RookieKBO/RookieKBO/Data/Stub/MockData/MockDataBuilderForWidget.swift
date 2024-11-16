//
//  MockDataBuilder.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

// 위젯에도 함께 사용되는 목업데이터 용도(match)
struct MockDataBuilderForWidget {
    
    static var mockMatch: Match {
        return Match(
            startDateTime: Date(),
            gameState: GameState.END,
            homeTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
            awayTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
            place: "한화 생명 이글스 파크",
            season: "정규시즌",
            scoreBoard: [
                ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 1, 0 ]),
                ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 1, 1])
            ]
        )
    }
    
    static var mockEmptyMatch: Match {
        return Match(
            startDateTime: Date(),
            gameState: GameState.END,
            homeTeam: Team(name: "", image: "", color: "", backgroundImage: ""),
            awayTeam: Team(name: "", image: "", color: "", backgroundImage: ""),
            place: "",
            season: "정규시즌",
            scoreBoard: []
        )
    }
    
    static var mockEndGameList: [Match] {
        return [
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                gameState: GameState.END,
                homeTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
                awayTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
                place: "한화 생명 이글스 파크",
                season: "포스트 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 1, 0 ]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 1, 1])
                ]
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                gameState: .PLAYING,
                homeTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                awayTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                place: "수원 위즈 파크",
                season: "포스트 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 45, hits: 2, errors: 3, balls: 4, scores: [1, 2, 3, 4, 5, 6, 7, 8, 9]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 45, hits: 6, errors: 7, balls: 8, scores: [9, 8, 7, 6, 5, 4, 3, 2, 1])
                ]
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
                gameState: GameState.END,
                homeTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
                awayTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
                place: "한화 생명 이글스 파크",
                season: "포스트 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 1, 0 ]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 1, 1])
                ]
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                gameState: .PLAYING,
                homeTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                awayTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                place: "수원 위즈 파크",
                season: "포스트 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 45, hits: 2, errors: 3, balls: 4, scores: [1, 2, 3, 4, 5, 6, 7, 8, 9]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 45, hits: 6, errors: 7, balls: 8, scores: [9, 8, 7, 6, 5, 4, 3, 2, 1])
                ]
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                gameState: .PLAYING,
                homeTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                awayTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                place: "수원 위즈 파크",
                season: "포스트 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 45, hits: 2, errors: 3, balls: 4, scores: [1, 2, 3, 4, 5, 6, 7, 8, 9]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 45, hits: 6, errors: 7, balls: 8, scores: [9, 8, 7, 6, 5, 4, 3, 2, 1])
                ]
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                gameState: .PLAYING,
                homeTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                awayTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                place: "수원 위즈 파크",
                season: "포스트 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 45, hits: 2, errors: 3, balls: 4, scores: [1, 2, 3, 4, 5, 6, 7, 8, 9]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 45, hits: 6, errors: 7, balls: 8, scores: [9, 8, 7, 6, 5, 4, 3, 2, 1])
                ]
            )
        ]
    }
    
    static var mockUpcommingGameList: [Match] {
        return [
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
                gameState: .CANCEL,
                homeTeam: Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung", backgroundImage: "samsungBg"),
                awayTeam: Team(name: "NC 다이노스", image: "ncUnder", color: "nc", backgroundImage: "ncBg"),
                place: "대구 삼성라이온즈파크",
                season: "포스트 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
                gameState: .PREPARE,
                homeTeam: Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia", backgroundImage: "kiaBg"),
                awayTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg", backgroundImage: "ssgBg"),
                place: "광주 기아챔피언스필드",
                season: "포스트 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: 0, to: Date())!,
                gameState: .PREPARE,
                homeTeam: Team(name: "KT 위즈", image: "ktUnder", color: "kt", backgroundImage: "ktBg"),
                awayTeam: Team(name: "NC 다이노스", image: "ncUnder", color: "nc", backgroundImage: "ncBg"),
                place: "수원 위즈 파크",
                season: "포스트 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: Calendar.current.date(byAdding: .day, value: 0, to: Date())!,
                gameState: .PREPARE,
                homeTeam: Team(name: "KT 위즈", image: "ktUnder", color: "kt", backgroundImage: "ktBg"),
                awayTeam: Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung", backgroundImage: "samsungBg"),
                place: "수원 위즈 파크",
                season: "포스트 시즌",
                scoreBoard: []
            )
        ]
    }
    
    static var mockMatchList: [Match] {
        let now = Date()
        let calendar = Calendar.current
        return [
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 0, second: 0, of: calendar.date(byAdding: .day, value: -3, to: now)!)!,
                gameState: GameState.END,
                homeTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
                awayTeam: Team(name: "NC 다이노스", image: "ncUnder", color: "nc", backgroundImage: "ncBg"),
                place: "잠실 야구장",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .AWAY, runs: 5, hits: 9, errors: 0, balls: 11, scores: [1, 1, 2, 0, 0, 0, 0, 0, 0, 1]),
                    ScoreBoard(homeAndAway: .HOME, runs: 4, hits: 8, errors: 1, balls: 10, scores: [1, 1, 0, 1, 0, 0 , 0, 0, 0, 0])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 0, second: 0, of: calendar.date(byAdding: .day, value: -3, to: now)!)!,
                gameState: .END,
                homeTeam: Team(name: "두산 베어스", image: "doosanUnder", color: "doosan", backgroundImage: "doosanBg"),
                awayTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg", backgroundImage: "ssgBg"),
                place: "인천 SSG 랜더스 필드",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .AWAY, runs: 3, hits: 2, errors: 3, balls: 4, scores: [1, 2, 0, 0, 0, 0, 0, 0, 0]),
                    ScoreBoard(homeAndAway: .HOME, runs: 0, hits: 6, errors: 7, balls: 8, scores: [0, 0, 0, 0, 0, 0, 0, 0, 0])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 0, second: 0, of: calendar.date(byAdding: .day, value: -3, to: now)!)!,
                gameState: GameState.END,
                homeTeam: Team(name: "KT 위즈", image: "ktUnder", color: "kt", backgroundImage: "ktBg"),
                awayTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                place: "수원 위즈 파크",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .AWAY, runs: 5, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 1, 0 ]),
                    ScoreBoard(homeAndAway: .HOME, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 1, 1])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: -3, to: now)!)!,
                gameState: .CANCEL,
                homeTeam: Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung", backgroundImage: "samsungBg"),
                awayTeam: Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia", backgroundImage: "kiaBg"),
                place: "대구 삼성 라이온즈 파크",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 0, second: 0, of: calendar.date(byAdding: .day, value: -3, to: now)!)!,
                gameState: GameState.END,
                homeTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
                awayTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                place: "한화 생명 이글스 파크",
                season: "정규 시즌",
                scoreBoard: [ScoreBoard(homeAndAway: .HOME, runs: 5, hits: 8, errors: 1, balls: 15, scores: [1, 1, 1, 0, 1, 0, 1, 0 ]),
                             ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 7, errors: 0, balls: 5, scores: [0, 0, 0, 0, 0, 0, 0, 1, 1])]
            ),
            
            // 8월 11일
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 0, second: 0, of: calendar.date(byAdding: .day, value: -2, to: now)!)!,
                gameState: .END,
                homeTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
                awayTeam: Team(name: "NC 다이노스", image: "ncUnder", color: "nc", backgroundImage: "ncBg"),
                place: "잠실 야구장",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 4, hits: 10, errors: 1, balls: 12, scores: [1, 1, 2, 0, 0, 0, 0]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 3, hits: 9, errors: 0, balls: 11, scores: [1, 1, 1, 0, 0, 0, 0, 0])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 0, second: 0, of: calendar.date(byAdding: .day, value: -2, to: now)!)!,
                gameState: .END,
                homeTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg", backgroundImage: "ssgBg"),
                awayTeam: Team(name: "두산 베어스", image: "doosanUnder", color: "doosan", backgroundImage: "doosanBg"),
                place: "인천 SSG 랜더스 필드",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 11, hits: 12, errors: 1, balls: 15, scores: [3, 0, 0, 0, 0, 2, 3, 3]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 9, hits: 10, errors: 1, balls: 13, scores: [2, 0, 0, 0, 0, 0, 1, 3, 3])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 0, second: 0, of: calendar.date(byAdding: .day, value: -2, to: now)!)!,
                gameState: .END,
                homeTeam: Team(name: "KT 위즈", image: "ktUnder", color: "kt", backgroundImage: "ktBg"),
                awayTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                place: "수원 위즈 파크",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 7, hits: 8, errors: 1, balls: 12, scores: [1, 2, 0, 0, 0, 1, 3, 0, 0]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 9, hits: 10, errors: 1, balls: 11, scores: [2, 3, 2, 2, 0, 0, 0, 0, 0])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 0, second: 0, of: calendar.date(byAdding: .day, value: -2, to: now)!)!,
                gameState: .END,
                homeTeam: Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung", backgroundImage: "samsungBg"),
                awayTeam: Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia", backgroundImage: "kiaBg"),
                place: "대구 삼성 라이온즈 파크",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .AWAY, runs: 5, hits: 9, errors: 0, balls: 11, scores: [1, 1, 2, 0, 0, 0, 0, 0, 0, 1]),
                    ScoreBoard(homeAndAway: .HOME, runs: 4, hits: 8, errors: 1, balls: 10, scores: [1, 1, 0, 1, 0, 0 , 0, 0, 0, 0])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 0, second: 0, of: calendar.date(byAdding: .day, value: -2, to: now)!)!,
                gameState: .END,
                homeTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                awayTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
                place: "고척 스카이돔",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 7, hits: 11, errors: 1, balls: 13, scores: [2, 2, 1, 2, 0, 0, 0, 0, 0]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 3, hits: 7, errors: 1, balls: 9, scores: [1, 1, 0, 1, 0, 0, 0, 0])
                ]
            ),
            // 8월 13일
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 0, to: now)!)!,
                gameState: .PLAYING,
                homeTeam: Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung", backgroundImage: "samsungBg"),
                awayTeam: Team(name: "KT 위즈", image: "ktUnder", color: "kt", backgroundImage: "ktBg"),
                place: "대구 삼성 라이온즈 파크",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 6, hits: 8, errors: 0, balls: 10, scores: [2, 1, 0, 1, 1 ]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 5, errors: 0, balls: 8, scores: [0, 0, 1, 1, 0 ])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 0, to: now)!)!,
                gameState: .END,
                homeTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg", backgroundImage: "ssgBg"),
                awayTeam: Team(name: "NC 다이노스", image: "ncUnder", color: "nc", backgroundImage: "ncBg"),
                place: "인천 SSG 랜더스 필드",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 2, hits: 5, errors: 1, balls: 10, scores: [1, 1, 0, 0, 0, 0, 0, 0 ]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 0, hits: 4, errors: 0, balls: 8, scores: [0, 0, 0, 0, 0, 0, 0, 0, 0])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 0, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                awayTeam: Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia", backgroundImage: "kiaBg"),
                place: "고척 스카이돔",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 1, hits: 3, errors: 0, balls: 9, scores: [0, 1, 0, 0]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 4, errors: 0, balls: 7, scores: [2, 0, 0, 0, 0])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 0, to: now)!)!,
                gameState: .PLAYING,
                homeTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
                awayTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
                place: "한화 생명 이글스 파크",
                season: "정규 시즌",
                scoreBoard: [
                    ScoreBoard(homeAndAway: .HOME, runs: 3, hits: 6, errors: 1, balls: 12, scores: [1, 1, 1]),
                    ScoreBoard(homeAndAway: .AWAY, runs: 2, hits: 8, errors: 0, balls: 10, scores: [0, 1, 1])
                ]
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 0, to: now)!)!,
                gameState: .CANCEL,
                homeTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                awayTeam: Team(name: "두산 베어스", image: "doosanUnder", color: "doosan", backgroundImage: "doosanBg"),
                place: "사직 야구장",
                season: "정규 시즌",
                scoreBoard: []
            ),
            // 8월 14일
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 1, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung", backgroundImage: "samsungBg"),
                awayTeam: Team(name: "KT 위즈", image: "ktUnder", color: "kt", backgroundImage: "ktBg"),
                place: "대구 삼성 라이온즈 파크",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 1, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "NC 다이노스", image: "ncUnder", color: "nc", backgroundImage: "ncBg"),
                awayTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg", backgroundImage: "ssgBg"),
                place: "창원 NC 파크",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 1, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                awayTeam: Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia", backgroundImage: "kiaBg"),
                place: "고척 스카이돔",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 1, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
                awayTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
                place: "한화 생명 이글스 파크",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 1, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "두산 베어스", image: "doosanUnder", color: "doosan", backgroundImage: "doosanBg"),
                awayTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                place: "잠실 야구장",
                season: "정규 시즌",
                scoreBoard: []
            ),
            // 8월 15일
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 2, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung", backgroundImage: "samsungBg"),
                awayTeam: Team(name: "KT 위즈", image: "ktUnder", color: "kt", backgroundImage: "ktBg"),
                place: "대구 삼성 라이온즈 파크",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 2, to: now)!)!,
                gameState: .PREPARE, // 예정
                homeTeam: Team(name: "NC 다이노스", image: "ncUnder", color: "nc", backgroundImage: "ncBg"),
                awayTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg", backgroundImage: "ssgBg"),
                place: "창원 NC 파크",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 2, to: now)!)!,
                gameState: .PREPARE, // 예정
                homeTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                awayTeam: Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia", backgroundImage: "kiaBg"),
                place: "고척 스카이돔",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 2, to: now)!)!,
                gameState: .PREPARE, // 예정
                homeTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
                awayTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
                place: "한화 생명 이글스 파크",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 2, to: now)!)!,
                gameState: .PREPARE, // 예정
                homeTeam: Team(name: "두산 베어스", image: "doosanUnder", color: "doosan", backgroundImage: "doosanBg"),
                awayTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                place: "잠실 야구장",
                season: "정규 시즌",
                scoreBoard: []
            ),
            // 8월 16일
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 3, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "롯데 자이언츠", image: "lotteUnder", color: "lotte", backgroundImage: "lotteBg"),
                awayTeam: Team(name: "키움 히어로즈", image: "kiwoomUnder", color: "kiwoom", backgroundImage: "kiwoomBg"),
                place: "사직 야구장",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 3, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "NC 다이노스", image: "ncUnder", color: "nc", backgroundImage: "ncBg"),
                awayTeam: Team(name: "삼성 라이온즈", image: "samsungUnder", color: "samsung", backgroundImage: "samsungBg"),
                place: "창원 NC 파크",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 3, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "LG 트윈스", image: "lgUnder", color: "lg", backgroundImage: "lgBg"),
                awayTeam: Team(name: "KIA 타이거즈", image: "kiaUnder", color: "kia", backgroundImage: "kiaBg"),
                place: "잠실 야구장",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 3, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "SSG 랜더스", image: "ssgUnder", color: "ssg", backgroundImage: "ssgBg"),
                awayTeam: Team(name: "한화 이글스", image: "hanwhaUnder", color: "hanwha", backgroundImage: "hanwhaBg"),
                place: "인천 SSG 랜더스 필드",
                season: "정규 시즌",
                scoreBoard: []
            ),
            Match(
                startDateTime: calendar.date(bySettingHour: 18, minute: 30, second: 0, of: calendar.date(byAdding: .day, value: 3, to: now)!)!,
                gameState: .PREPARE,
                homeTeam: Team(name: "KT 위즈", image: "ktUnder", color: "kt", backgroundImage: "ktBg"),
                awayTeam: Team(name: "두산 베어스", image: "doosanUnder", color: "doosan", backgroundImage: "doosanBg"),
                place: "수원 위즈 파크",
                season: "정규 시즌",
                scoreBoard: []
            )
        ]
    }
}
