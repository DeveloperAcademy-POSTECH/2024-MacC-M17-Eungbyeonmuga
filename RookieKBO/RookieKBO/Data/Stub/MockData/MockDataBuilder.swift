//
//  MockDataBuilder.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation

struct MockDataBuilder {
    static var mockTranscript: VideoTranscript {
        return VideoTranscript(
            videoId: "video1",
            transcript: [
                TranscriptItem(id: UUID(), text: "박성한이 백투백 홈런", start: 0.0),
                TranscriptItem(id: UUID(), text: "백투백 홈런", start: 10.0),
                TranscriptItem(id: UUID(), text: "중견수", start: 5.5),
                TranscriptItem(id: UUID(), text: "중견수", start: 15.5),
                TranscriptItem(id: UUID(), text: "박성한이 도루함", start: 12.0),
                TranscriptItem(id: UUID(), text: "도루", start: 22.0),
                TranscriptItem(id: UUID(), text: "박성한이 홈런", start: 20.0),
                TranscriptItem(id: UUID(), text: "홈런", start: 40.0),
                TranscriptItem(id: UUID(), text: "박성한이 사이클링 히트", start: 30.0),
                TranscriptItem(id: UUID(), text: "사이클링 히트", start: 100.0),
                TranscriptItem(id: UUID(), text: "사이클링 히트", start: 110.0),
            ]
        )
    }
    
    static var mockSavedTerms: [TermEntry] {
        return [
            TermEntry(term: "Swift", definition: "A powerful programming language used for iOS and macOS development."),
            TermEntry(term: "Xcode", definition: "An integrated development environment (IDE) for macOS to develop software for Apple platforms."),
            TermEntry(term: "UIKit", definition: "A framework that provides the necessary infrastructure for iOS apps."),
            TermEntry(term: "CoreData", definition: "An object graph and persistence framework for macOS and iOS.")
        ]
    }
    
    static var mockHighlightInfo: [Highlight] {
        return [
            Highlight(
                title: "[KBO 하이라이트] 10.28 삼성 vs KIA | KS 5차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-28",
                thumbnail: "https://img.youtube.com/vi/8HyQHBYaROQ/maxresdefault.jpg",
                videoId: "8HyQHBYaROQ"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.26 KIA vs 삼성 | KS 4차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-26",
                thumbnail: "https://img.youtube.com/vi/uaK6e95za0w/maxresdefault.jpg",
                videoId: "uaK6e95za0w"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.25 KIA vs 삼성 | KS 3차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-25",
                thumbnail: "https://img.youtube.com/vi/KX9a8IufZzk/maxresdefault.jpg",
                videoId: "KX9a8IufZzk"
            )
        ]
    }
    
    static var mockTeamRank: TeamRank {
        return TeamRank(
            id: UUID(),
            rank: "3",
            team: "LG",
            wins: "76",
            draws: "2",
            losses: "66",
            winRate: "0.535"
        )
    }
    
    static var mockTeamRanks: [TeamRank] {
        return [
            TeamRank(
                id: UUID(),
                rank: "1",
                team: "KIA",
                wins: "87",
                draws: "2",
                losses: "55",
                winRate: "0.613"
            ),
            TeamRank(
                id: UUID(),
                rank: "2",
                team: "삼성",
                wins: "78",
                draws: "2",
                losses: "64",
                winRate: "0.549"
            ),
            TeamRank(
                id: UUID(),
                rank: "3",
                team: "LG",
                wins: "76",
                draws: "2",
                losses: "66",
                winRate: "0.535"
            ),
            TeamRank(
                id: UUID(),
                rank: "4",
                team: "두산",
                wins: "74",
                draws: "2",
                losses: "68",
                winRate: "0.521"
            ),
            TeamRank(
                id: UUID(),
                rank: "5",
                team: "KT",
                wins: "72",
                draws: "2",
                losses: "70",
                winRate: "0.507"
            ),
            TeamRank(
                id: UUID(),
                rank: "5",
                team: "SSG",
                wins: "72",
                draws: "2",
                losses: "70",
                winRate: "0.507"
            ),
            TeamRank(
                id: UUID(),
                rank: "7",
                team: "롯데",
                wins: "66",
                draws: "4",
                losses: "74",
                winRate: "0.471"
            ),
            TeamRank(
                id: UUID(),
                rank: "8",
                team: "한화",
                wins: "66",
                draws: "2",
                losses: "76",
                winRate: "0.465"
            ),
            TeamRank(
                id: UUID(),
                rank: "9",
                team: "NC",
                wins: "61",
                draws: "2",
                losses: "81",
                winRate: "0.430"
            ),
            TeamRank(
                id: UUID(),
                rank: "10",
                team: "키움",
                wins: "58",
                draws: "0",
                losses: "86",
                winRate: "0.403"
            )
        ]
    }
    
    static var mockNews: [News] {
        return [
            News(
                title: "'김도영 펄펄 날다' 그랜드슬램→호수비 2회→솔로포 5타점 대폭발!…류중일호 쿠바에 8-4 승리, 슈퍼라운드 위한 첫발 디뎠다 [MD타이베이]",
                imageUrl: "https://static-cdn.sporki.com/news/mydaily/202411/2378328/l_2024110118585792408_l.jpg",
                publisher: "마이데일리",
                link: "https://sporki.com/kbaseball/news/2037531"
            ),
            News(
                title: "‘만루포+솔로포+미친 수비’ 김도영의 국제무대 대관식…대만 쇼크 극복! 한국, 쿠바 8-4 제압→프리미어12 첫 승 [프리미어12 리뷰]",
                imageUrl: "https://static-cdn.sporki.com/news/osen/202411/2378369/l_202411142050775543_6735f0951110d.jpg",
                publisher: "OSEN",
                link: "https://sporki.com/kbaseball/news/2037533"
            ),
            News(
                title: "류중일 감독 결단! 김도영-박동원 빼고 '왼손 타자 7명' 전원 출격…반드시 이겨야 한다 '한일전' 슈퍼라운드 진출과 자존심 싸움을 위해 [타이베이 현장]",
                imageUrl: "https://static-cdn.sporki.com/news/xports/202411/2380840/l_1731662811591448.jpg",
                publisher: "엑스포츠뉴스",
                link: "https://sporki.com/kbaseball/news/2039098"
            ),
            News(
                title: "야구 취미반 학생, 한일전 선발 맡다…선동열의 남자, 새로운 日킬러 될까 “패기 있게 던질 것” [오!쎈 타이베이]",
                imageUrl: "https://static-cdn.sporki.com/news/osen/202411/2379638/l_202411150948774357_6736a30cab7f8.jpg",
                publisher: "OSEN",
                link: "https://sporki.com/kbaseball/news/2038498"
            ),
            News(
                title: "[속보] '김도영 홈런 2방' 한국, 쿠바 꺾고 프리미어12 첫승…'1승1패'",
                imageUrl: "https://static-cdn.sporki.com/news/newsone/202411/2378322/l_2024-11-14T221635_5601038_sports_6986306.jpg",
                publisher: "뉴스1",
                link: "https://sporki.com/kbaseball/news/2037526"
            ),
            News(
                title: "'쿠바 격파' 류중일 감독 활짝 웃었다…\"곽빈 호투, 김도영에게 찬스 살린 게 결정적…한일전 최승용\"",
                imageUrl: "https://static-cdn.sporki.com/news/spotv/202411/2378454/l_714949_1126387_39.jpg",
                publisher: "스포티비뉴스",
                link: "https://sporki.com/kbaseball/news/2037629"
            ),
            News(
                title: "예상치 못한 ‘김도영 쇼케이스’… 국제 경쟁력 스텝 밟기 시작했다",
                imageUrl: "https://static-cdn.sporki.com/news/sportsworld/202411/2379285/l_20241115500824.jpg",
                publisher: "스포츠월드",
                link: "https://sporki.com/kbaseball/news/2038000"
            )
        ]
    }
}
