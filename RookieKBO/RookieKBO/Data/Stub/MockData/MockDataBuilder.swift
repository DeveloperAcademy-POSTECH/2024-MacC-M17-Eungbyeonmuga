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
                TranscriptItem(id: UUID(), text: "박성한이 백투백 홈런", description: "", start: 0.0),
                TranscriptItem(id: UUID(), text: "백투 홈런", description: "", start: 10.0),
                TranscriptItem(id: UUID(), text: "않타", description: "", start: 5.5),
                TranscriptItem(id: UUID(), text: "중견수", description: "", start: 15.5),
                TranscriptItem(id: UUID(), text: "박성한이 도루함", description: "", start: 12.0),
                TranscriptItem(id: UUID(), text: "도루", description: "", start: 22.0),
                TranscriptItem(id: UUID(), text: "박성한이 홈런", description: "", start: 20.0),
                TranscriptItem(id: UUID(), text: "홈런", description: "", start: 40.0),
                TranscriptItem(id: UUID(), text: "박성한이 사이클링 히트", description: "",  start: 30.0),
                TranscriptItem(id: UUID(), text: "사이클링 히트", description: "", start: 100.0),
                TranscriptItem(id: UUID(), text: "사이클링 히트", description: "", start: 110.0),
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
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.23 삼성 vs KIA | KS 2차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-23",
                thumbnail: "https://img.youtube.com/vi/h2sSFb4iO5w/maxresdefault.jpg",
                videoId: "h2sSFb4iO5w"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.21 삼성 vs KIA | KS 1차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-21",
                thumbnail: "https://img.youtube.com/vi/CPjtZBpAAiM/maxresdefault.jpg",
                videoId: "CPjtZBpAAiM"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.19 삼성 vs LG | PO 4차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-19",
                thumbnail: "https://img.youtube.com/vi/wFm3TGtGGe0/maxresdefault.jpg",
                videoId: "wFm3TGtGGe0"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.17 삼성 vs LG | PO 3차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-17",
                thumbnail: "https://img.youtube.com/vi/KlG1g-Qifvk/maxresdefault.jpg",
                videoId: "KlG1g-Qifvk"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.15 LG vs 삼성 | PO 2차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-15",
                thumbnail: "https://img.youtube.com/vi/fKadbXi2ziA/maxresdefault.jpg",
                videoId: "fKadbXi2ziA"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.13 LG vs 삼성 | PO 1차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-13",
                thumbnail: "https://img.youtube.com/vi/JPlJDQq9mAk/maxresdefault.jpg",
                videoId: "JPlJDQq9mAk"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.11 KT vs LG | 준PO 5차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-11",
                thumbnail: "https://img.youtube.com/vi/HY3nhUc23qQ/maxresdefault.jpg",
                videoId: "HY3nhUc23qQ"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.9 LG vs KT | 준PO 4차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-09",
                thumbnail: "https://img.youtube.com/vi/dO_HtRbaUf4/maxresdefault.jpg",
                videoId: "dO_HtRbaUf4"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.8 LG vs KT | 준PO 3차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-08",
                thumbnail: "https://img.youtube.com/vi/q1GKlVUfmvI/maxresdefault.jpg",
                videoId: "q1GKlVUfmvI"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.6 KT vs LG | 준PO 2차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-06",
                thumbnail: "https://img.youtube.com/vi/wMNCED6dOuE/maxresdefault.jpg",
                videoId: "wMNCED6dOuE"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.5 KT vs LG | 준PO 1차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-05",
                thumbnail: "https://img.youtube.com/vi/A4s_8HnDKkQ/maxresdefault.jpg",
                videoId: "A4s_8HnDKkQ"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.3 KT vs 두산 | WC 2차전 | 2024 KBO 포스트시즌 | 야구",
                date: "2024-10-03",
                thumbnail: "https://img.youtube.com/vi/qtWxM9Pka4s/maxresdefault.jpg",
                videoId: "qtWxM9Pka4s"
            ),
            Highlight(
                title: "[KBO 하이라이트] 10.2 KT vs 두산 | WC 1차전 | 2024 신한 SOL뱅크 KBO 포스트시즌 | 야구",
                date: "2024-10-02",
                thumbnail: "https://img.youtube.com/vi/BjPizSf4m2M/maxresdefault.jpg",
                videoId: "BjPizSf4m2M"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.30 키움 vs SSG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-30",
                thumbnail: "https://img.youtube.com/vi/Lc0qABAPNYk/maxresdefault.jpg",
                videoId: "Lc0qABAPNYk"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.30 NC vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-30",
                thumbnail: "https://img.youtube.com/vi/xqMXms9ZYrI/maxresdefault.jpg",
                videoId: "xqMXms9ZYrI"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.29 NC vs 한화 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-29",
                thumbnail: "https://img.youtube.com/vi/EAsa-OEEnpQ/maxresdefault.jpg",
                videoId: "EAsa-OEEnpQ"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.28 키움 vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-28",
                thumbnail: "https://img.youtube.com/vi/P9eP5iq27vE/maxresdefault.jpg",
                videoId: "P9eP5iq27vE"
            ),
            
            Highlight(
                title: "[KBO 하이라이트] 9.28 SSG vs 한화 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-28",
                thumbnail: "https://img.youtube.com/vi/5x6PLm6WILw/maxresdefault.jpg",
                videoId: "5x6PLm6WILw"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.28 두산 vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-28",
                thumbnail: "https://img.youtube.com/vi/gUCX1Z5RFCA/maxresdefault.jpg",
                videoId: "gUCX1Z5RFCA"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.28 LG vs 삼성 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-28",
                thumbnail: "https://img.youtube.com/vi/c4yiHxrGfx0/maxresdefault.jpg",
                videoId: "c4yiHxrGfx0"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.28 KIA vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-28",
                thumbnail: "https://img.youtube.com/vi/k5F6P1PO3k4/maxresdefault.jpg",
                videoId: "k5F6P1PO3k4"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.27 키움 vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-27",
                thumbnail: "https://img.youtube.com/vi/2Cz3tvEgHdE/maxresdefault.jpg",
                videoId: "2Cz3tvEgHdE"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.27 KIA vs 한화 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-27",
                thumbnail: "https://img.youtube.com/vi/D3hLv1uH90c/maxresdefault.jpg",
                videoId: "D3hLv1uH90c"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.27 NC vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-27",
                thumbnail: "https://img.youtube.com/vi/Oj1CQXdLFsk/maxresdefault.jpg",
                videoId: "Oj1CQXdLFsk"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.26 두산 vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-26",
                thumbnail: "https://img.youtube.com/vi/XthBwiXNuo8/maxresdefault.jpg",
                videoId: "XthBwiXNuo8"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.26 SSG vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-26",
                thumbnail: "https://img.youtube.com/vi/gJV_V_nyTRU/maxresdefault.jpg",
                videoId: "gJV_V_nyTRU"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.26 키움 vs LG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-26",
                thumbnail: "https://img.youtube.com/vi/GMhifwPzOLA/maxresdefault.jpg",
                videoId: "GMhifwPzOLA"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.25 롯데 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-25",
                thumbnail: "https://img.youtube.com/vi/Lt3cs3x7-ek/maxresdefault.jpg",
                videoId: "Lt3cs3x7-ek"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.25 SSG vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-25",
                thumbnail: "https://img.youtube.com/vi/_4frgk4VbjY/maxresdefault.jpg",
                videoId: "_4frgk4VbjY"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.25 키움 vs 삼성 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-25",
                thumbnail: "https://img.youtube.com/vi/C8eEcp-cPow/maxresdefault.jpg",
                videoId: "C8eEcp-cPow"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.25 한화 vs LG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-25",
                thumbnail: "https://img.youtube.com/vi/7RAkdf8OGPs/maxresdefault.jpg",
                videoId: "7RAkdf8OGPs"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.24 한화 vs 키움 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-24",
                thumbnail: "https://img.youtube.com/vi/RlpkN_49ufw/maxresdefault.jpg",
                videoId: "RlpkN_49ufw"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.24 삼성 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-24",
                thumbnail: "https://img.youtube.com/vi/1iNjTferMG4/maxresdefault.jpg",
                videoId: "1iNjTferMG4"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.24 롯데 vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-24",
                thumbnail: "https://img.youtube.com/vi/mL5uALQDwss/maxresdefault.jpg",
                videoId: "mL5uALQDwss"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.24 LG vs SSG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-24",
                thumbnail: "https://img.youtube.com/vi/6LsQdRBiuFk/maxresdefault.jpg",
                videoId: "6LsQdRBiuFk"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.24 NC vs 두산 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-24",
                thumbnail: "https://img.youtube.com/vi/7lNb-eW6tKo/maxresdefault.jpg",
                videoId: "7lNb-eW6tKo"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.23 롯데 vs 한화 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-23",
                thumbnail: "https://img.youtube.com/vi/by215JQ9uhw/maxresdefault.jpg",
                videoId: "by215JQ9uhw"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.23 삼성 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-23",
                thumbnail: "https://img.youtube.com/vi/uzUtFH8xKeg/maxresdefault.jpg",
                videoId: "uzUtFH8xKeg"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.23 SSG vs 두산 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-23",
                thumbnail: "https://img.youtube.com/vi/huYlZsQhdz0/maxresdefault.jpg",
                videoId: "huYlZsQhdz0"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.22 롯데 vs 한화 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-22",
                thumbnail: "https://img.youtube.com/vi/8wyFKeoUjKU/maxresdefault.jpg",
                videoId: "8wyFKeoUjKU"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.22 SSG vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-22",
                thumbnail: "https://img.youtube.com/vi/F2EnIn0XKbk/maxresdefault.jpg",
                videoId: "F2EnIn0XKbk"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.22 키움 vs 삼성 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-22",
                thumbnail: "https://img.youtube.com/vi/mPrzP2zTyOs/maxresdefault.jpg",
                videoId: "mPrzP2zTyOs"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.22 두산 vs LG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-22",
                thumbnail: "https://img.youtube.com/vi/7E8E7wBHe78/maxresdefault.jpg",
                videoId: "7E8E7wBHe78"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.21 SSG vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-21",
                thumbnail: "https://img.youtube.com/vi/ur7sqn1CYEU/maxresdefault.jpg",
                videoId: "ur7sqn1CYEU"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.21 두산 vs LG | DH2 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-21",
                thumbnail: "https://img.youtube.com/vi/EBudRPkga5A/maxresdefault.jpg",
                videoId: "EBudRPkga5A"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.21 두산 vs LG | DH1 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-21",
                thumbnail: "https://img.youtube.com/vi/JmgTT4Nxcl0/maxresdefault.jpg",
                videoId: "JmgTT4Nxcl0"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.19 삼성 vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-19",
                thumbnail: "https://img.youtube.com/vi/-SgWyJfgzZo/maxresdefault.jpg",
                videoId: "-SgWyJfgzZo"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.19 한화 vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-19",
                thumbnail: "https://img.youtube.com/vi/1ixg9oVXmyM/maxresdefault.jpg",
                videoId: "1ixg9oVXmyM"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.19 LG vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-19",
                thumbnail: "https://img.youtube.com/vi/mE6eLitZO04/maxresdefault.jpg",
                videoId: "mE6eLitZO04"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.19 키움 vs SSG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-19",
                thumbnail: "https://img.youtube.com/vi/B6qcnt4KW54/maxresdefault.jpg",
                videoId: "B6qcnt4KW54"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.19 KIA vs 두산 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-19",
                thumbnail: "https://img.youtube.com/vi/AspF5vakmPc/maxresdefault.jpg",
                videoId: "AspF5vakmPc"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.18 LG vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-18",
                thumbnail: "https://img.youtube.com/vi/z9pVLuxnZ2Y/maxresdefault.jpg",
                videoId: "z9pVLuxnZ2Y"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.18 삼성 vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-18",
                thumbnail: "https://img.youtube.com/vi/6aOCPAjN5I0/maxresdefault.jpg",
                videoId: "6aOCPAjN5I0"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.18 한화 vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-18",
                thumbnail: "https://img.youtube.com/vi/Pk86fefh8DM/maxresdefault.jpg",
                videoId: "Pk86fefh8DM"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.17 LG vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-17",
                thumbnail: "https://img.youtube.com/vi/2gTACiHfkVY/maxresdefault.jpg",
                videoId: "2gTACiHfkVY"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.17 삼성 vs 두산 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-17",
                thumbnail: "https://img.youtube.com/vi/W2dQAXSfFfE/maxresdefault.jpg",
                videoId: "W2dQAXSfFfE"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.17 KIA vs SSG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-17",
                thumbnail: "https://img.youtube.com/vi/wqMOHIZbU8s/maxresdefault.jpg",
                videoId: "wqMOHIZbU8s"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.17 KT vs 키움 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-17",
                thumbnail: "https://img.youtube.com/vi/SUG22GgTc2E/maxresdefault.jpg",
                videoId: "SUG22GgTc2E"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.17 한화 vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-17",
                thumbnail: "https://img.youtube.com/vi/AqdSODkuTXE/maxresdefault.jpg",
                videoId: "AqdSODkuTXE"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.16 키움 vs 두산 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-16",
                thumbnail: "https://img.youtube.com/vi/Ve8ZcsaQ40o/maxresdefault.jpg",
                videoId: "Ve8ZcsaQ40o"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.16 KIA vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-16",
                thumbnail: "https://img.youtube.com/vi/Dpb3UvImUoo/maxresdefault.jpg",
                videoId: "Dpb3UvImUoo"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.15 한화 vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-15",
                thumbnail: "https://img.youtube.com/vi/7SjC01og0CA/maxresdefault.jpg",
                videoId: "7SjC01og0CA"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.15 키움 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-15",
                thumbnail: "https://img.youtube.com/vi/ar7PD9d7uDU/maxresdefault.jpg",
                videoId: "ar7PD9d7uDU"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.15 삼성 vs SSG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-15",
                thumbnail: "https://img.youtube.com/vi/MHvOvDxSZGs/maxresdefault.jpg",
                videoId: "MHvOvDxSZGs"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.15 LG vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-15",
                thumbnail: "https://img.youtube.com/vi/rg4e5SBizAY/maxresdefault.jpg",
                videoId: "rg4e5SBizAY"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.14 LG vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-14",
                thumbnail: "https://img.youtube.com/vi/25Y92Co22CQ/maxresdefault.jpg",
                videoId: "25Y92Co22CQ"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.14 KT vs 두산 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-14",
                thumbnail: "https://img.youtube.com/vi/zvn2kLWCz88/maxresdefault.jpg",
                videoId: "zvn2kLWCz88"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.14 키움 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-14",
                thumbnail: "https://img.youtube.com/vi/B9Jmwwwa6wc/maxresdefault.jpg",
                videoId: "B9Jmwwwa6wc"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.14 한화 vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-14",
                thumbnail: "https://img.youtube.com/vi/DW_f3c5Qt94/maxresdefault.jpg",
                videoId: "DW_f3c5Qt94"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.14 삼성 vs SSG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-14",
                thumbnail: "https://img.youtube.com/vi/wkBVMe1tAsE/maxresdefault.jpg",
                videoId: "wkBVMe1tAsE"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.13 한화 vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-13",
                thumbnail: "https://img.youtube.com/vi/l7SPB-aHTUE/maxresdefault.jpg",
                videoId: "l7SPB-aHTUE"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.12 롯데 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-12",
                thumbnail: "https://img.youtube.com/vi/EgF7nf7TIB4/maxresdefault.jpg",
                videoId: "EgF7nf7TIB4"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.12 삼성 vs 한화 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-12",
                thumbnail: "https://img.youtube.com/vi/vxt1uzZdC0A/maxresdefault.jpg",
                videoId: "vxt1uzZdC0A"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.12 NC vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-12",
                thumbnail: "https://img.youtube.com/vi/2apPJQsqkqI/maxresdefault.jpg",
                videoId: "2apPJQsqkqI"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.11 삼성 vs 한화 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-11",
                thumbnail: "https://img.youtube.com/vi/rKf4eASQeEw/maxresdefault.jpg",
                videoId: "rKf4eASQeEw"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.11 NC vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-11",
                thumbnail: "https://img.youtube.com/vi/qL1aOobvJtE/maxresdefault.jpg",
                videoId: "qL1aOobvJtE"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.11 롯데 vs SSG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-11",
                thumbnail: "https://img.youtube.com/vi/JvkEPK6Sjv8/maxresdefault.jpg",
                videoId: "JvkEPK6Sjv8"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.11 키움 vs LG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-11",
                thumbnail: "https://img.youtube.com/vi/kxSE5gj42EQ/maxresdefault.jpg",
                videoId: "kxSE5gj42EQ"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.10 두산 vs 키움 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-10",
                thumbnail: "https://img.youtube.com/vi/KvYdxZZE7OI/maxresdefault.jpg",
                videoId: "KvYdxZZE7OI"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.10 NC vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-10",
                thumbnail: "https://img.youtube.com/vi/KE5h4ygUdHs/maxresdefault.jpg",
                videoId: "KE5h4ygUdHs"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.10 한화 vs SSG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-10",
                thumbnail: "https://img.youtube.com/vi/YEyCeU9SpOw/maxresdefault.jpg",
                videoId: "YEyCeU9SpOw"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.10 롯데 vs LG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-10",
                thumbnail: "https://img.youtube.com/vi/kTgeSnFVZdA/maxresdefault.jpg",
                videoId: "kTgeSnFVZdA"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.8 NC vs 삼성 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-08",
                thumbnail: "https://img.youtube.com/vi/XucfH5effB8/maxresdefault.jpg",
                videoId: "XucfH5effB8"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.8 SSG vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-08",
                thumbnail: "https://img.youtube.com/vi/iXvaOBUOnLY/maxresdefault.jpg",
                videoId: "iXvaOBUOnLY"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.8 한화 vs LG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-08",
                thumbnail: "https://img.youtube.com/vi/yuCDaAwOT0s/maxresdefault.jpg",
                videoId: "yuCDaAwOT0s"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.8 키움 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-08",
                thumbnail: "https://img.youtube.com/vi/1xQv3h9vZBQ/maxresdefault.jpg",
                videoId: "1xQv3h9vZBQ"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.7 SSG vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-07",
                thumbnail: "https://img.youtube.com/vi/hh7eRpdXhEY/maxresdefault.jpg",
                videoId: "hh7eRpdXhEY"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.7 키움 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-07",
                thumbnail: "https://img.youtube.com/vi/xxvNL8Z5g3U/maxresdefault.jpg",
                videoId: "xxvNL8Z5g3U"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.7 두산 vs KT | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-07",
                thumbnail: "https://img.youtube.com/vi/KGZPKBLKD_4/maxresdefault.jpg",
                videoId: "KGZPKBLKD_4"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.7 NC vs 삼성 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-07",
                thumbnail: "https://img.youtube.com/vi/gOPokJ2jAiM/maxresdefault.jpg",
                videoId: "gOPokJ2jAiM"
            ),
            Highlight(
                title: "[KBO 하이라이트] 9.7 한화 vs LG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-07",
                thumbnail: "https://img.youtube.com/vi/XnV2g1Lmbd4/maxresdefault.jpg",
                videoId: "XnV2g1Lmbd4"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.6 키움 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-06",
                thumbnail: "https://img.youtube.com/vi/uPBG8zMV5hY/maxresdefault.jpg",
                videoId: "uPBG8zMV5hY"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.6 KT vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-06",
                thumbnail: "https://img.youtube.com/vi/IZ4-Pt_IYNw/maxresdefault.jpg",
                videoId: "IZ4-Pt_IYNw"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.6 삼성 vs 롯데 | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-06",
                thumbnail: "https://img.youtube.com/vi/TPu6TX0uPYE/maxresdefault.jpg",
                videoId: "TPu6TX0uPYE"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.6 한화 vs LG | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-06",
                thumbnail: "https://img.youtube.com/vi/A-LWAlj40WU/maxresdefault.jpg",
                videoId: "A-LWAlj40WU"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.5 키움 vs NC | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-05",
                thumbnail: "https://img.youtube.com/vi/Y2U49INHpUI/maxresdefault.jpg",
                videoId: "Y2U49INHpUI"
            ),
            Highlight(
                title: "[KBO 하이라이트]  9.5 한화 vs KIA | 2024 신한 SOL뱅크 KBO 리그 | 야구",
                date: "2024-09-05",
                thumbnail: "https://img.youtube.com/vi/sRUinRyJP-s/maxresdefault.jpg",
                videoId: "sRUinRyJP-s"
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
    
    static var mockNews: News {
        return News(
            title: "'김도영 펄펄 날다' 그랜드슬램→호수비 2회→솔로포 5타점 대폭발!…류중일호 쿠바에 8-4 승리, 슈퍼라운드 위한 첫발 디뎠다 [MD타이베이]",
            imageUrl: "https://static-cdn.sporki.com/news/mydaily/202411/2378328/l_2024110118585792408_l.jpg",
            publisher: "마이데일리",
            link: "https://sporki.com/kbaseball/news/2037531"
        )
    }
    
    static var mockEntireNews: [News] {
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
