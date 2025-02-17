//
//  TermDictionary.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation

let termDictionary: [String: String] = [
    "한국 시리즈": "KBO 리그의 챔피언 결정전",
    "준플레이오프": "한국 시리즈 진출을 위한 예선 경기",
    "플레이오프": "포스트시즌에서 한국 시리즈 진출을 위한 경기",
    "와일드카드 결정전": "포스트시즌 진출을 위한 결정전",
    "디펜딩 챔피언": "전년도 우승 팀",
    "포스트 시즌": "정규 시즌 이후 열리는 토너먼트 경기",
    "업셋": "하위 팀이 상위 팀을 이기고 승리하는 경우",
    "홈런": "타자가 공을 외야 펜스를 넘겨 득점하는 타격",
    "백투백 홈런": "연속으로 두 타자가 홈런을 치는 경우",
    "그랜드 슬램": "만루 상황에서 홈런을 쳐서 4점을 득점",
    "만루 홈런": "만루 상황에서 홈런을 쳐서 4점을 득점",
    "솔로 홈런": "주자 없는 상황에서의 홈런",
    "투런 홈런": "주자 1명과 함께 득점하는 홈런",
    "쓰리런 홈런": "주자 2명과 함께 득점하는 홈런",
    "적시타": "주자를 홈으로 불러들이는 타격",
    "타점": "타격으로 인해 주자가 득점했을 때의 점수",
    "안타": "타자가 공을 쳐서 출루하는 타격",
    "단타": "타자가 1루까지 진루하는 안타",
    "2루타": "타자가 2루까지 진루하는 안타",
    "3루타": "타자가 3루까지 진루하는 안타",
    "내야 안타": "내야에서 수비수가 잡지 못한 안타",
    "플라이 아웃": "공이 공중에 떠서 수비수에게 잡히는 경우",
    "라인 드라이브": "공이 직선으로 빠르게 날아가는 타격",
    "땅볼": "타구가 땅에 튀는 타격",
    "번트": "타자가 공을 가볍게 밀어내듯 치는 타격",
    "희생 번트": "주자를 진루시키기 위해 희생하는 번트",
    "스퀴즈 번트": "주자가 홈으로 들어오기 위해 희생 번트를 하는 작전",
    "만루": "주자가 1루, 2루, 3루에 모두 있는 상황",
    "도루": "주자가 투수의 투구 시기를 이용해 진루",
    "더블 스틸": "두 주자가 동시에 도루",
    "트리플 플레이": "한 번의 수비로 세 명의 주자를 아웃",
    "백핸드 캐치": "글러브의 뒷면으로 공을 잡는 수비",
    "홈 스틸": "주자가 3루에서 홈으로 도루",
    "포스 아웃": "진루를 강요받은 주자가 아웃되는 상황",
    "태그 아웃": "수비수가 주자를 태그해 아웃시키는 상황",
    "견제": "투수가 주자의 도루를 저지하기 위해 던지는 행동",
    "보크": "투수의 부정 행위로 주자가 진루",
    "선발 투수": "경기를 시작하는 투수",
    "구원 투수": "선발 투수 이후에 등판하는 투수",
    "마무리 투수": "경기를 마무리하는 역할의 투수",
    "불펜": "구원 투수들이 대기하는 장소 및 투수진",
    "체인지업": "느린 구속으로 타자의 타이밍을 뺏는 변화구",
    "포크볼": "공이 아래로 떨어지는 변화구",
    "슬라이더": "좌우로 크게 휘어지는 변화구",
    "커브볼": "크게 휘어지는 느린 변화구",
    "투심 직구": "투심 그립으로 던지는 직구",
    "포심 직구": "포심 그립으로 던지는 직구",
    "스위퍼": "큰 각도로 휘어지는 슬라이더",
    "완봉승": "투수가 상대팀에게 득점을 허용하지 않고 이기는 경기",
    "노히트 노런": "안타와 득점을 모두 허용하지 않는 경기",
    "볼넷": "투수가 네 번의 볼을 던져 타자가 1루로 진루",
    "사구": "타자가 투수의 공에 맞아 1루로 진루",
    "체크 스윙": "타자가 스윙을 하려다 멈춘 동작",
    "에러": "수비 실수로 주자가 진루하거나 득점",
    "골든 글러브": "최고의 수비 실력을 보여준 선수에게 주는 상",
    "사이클링 히트": "한 경기에서 단타, 2루타, 3루타, 홈런을 모두 치는 경우",
    "세이브": "마무리 투수가 리드를 지키며 경기를 끝내는 경우",
    "블론 세이브": "마무리 투수가 리드를 지키지 못하고 동점을 허용",
    "득점권": "주자가 득점할 가능성이 높은 위치 (2루, 3루)",
    "결승타": "경기를 결정짓는 타격",
    "타격감": "타자의 현재 타격 상태",
    "리드오프": "경기의 첫 번째 타자",
    "클러치 히터": "중요한 순간에 타격 실력이 뛰어난 타자",
    "승부수": "경기의 흐름을 바꾸는 결정적인 플레이",
    "중견수": "야구장에서 외야의 가운데를 수비하는 선수",
    "볼카운트": "투수가 던진 공이 스트라이크와 볼로 얼마나 기록되었는지를 나타내는 수치",
    "우중간": "야구장에서 우익수와 중견수 사이의 공간",
    "최고 구속": "투수가 던진 공의 최고 속도",
    "우익수": "야구장에서 외야의 오른쪽을 수비하는 선수",
    "좌익수": "야구장에서 외야의 왼쪽을 수비하는 선수",
    "이닝": "야구 경기에서 공격과 수비가 한 번씩 진행되는 단위",
    "파인플레이": "수비수가 보여주는 뛰어나고 인상적인 수비 플레이",
    "타석": "타자가 공을 치기 위해 서는 위치",
    "마운드": "투수가 공을 던지는 야구장의 중심에 위치한 언덕",
    "변화구": "투수가 직구와는 다르게 공을 회전시켜 궤적을 변화시키는 투구",
    "유격수": "내야에서 2루와 3루 사이를 수비하는 선수",
    "히팅 포인트": "타자가 공을 이상적으로 타격하는 지점",
    "풀베이스": "베이스에 주자가 모두 있는 상태",
    "삼구삼진": "투수가 세 번의 스트라이크만으로 타자를 아웃시키는 상황",
    "고의 4구": "투수가 네 개의 볼을 던져 타자가 자동으로 1루로 진출하는 상황"
]

let normalizedTerms: [String: String] = [
    "코리안 시리즈": "한국 시리즈",
    "준피 올로프": "준플레이오프",
    "와일드 카드": "와일드카드 결정전",
    "포스 시즌": "포스트 시즌",
    "그랜 슬램": "그랜드 슬램",
    "백투 홈런": "백투백 홈런",
    "솔로": "솔로 홈런",
    "투런": "투런 홈런",
    "쓰리런": "쓰리런 홈런",
    "않타": "안타",
    "말루": "만루",
    "포크 볼": "포크볼",
    "슬라이드": "슬라이더",
    "커브 볼": "커브볼",
    "백투 백 홈런": "백투백 홈런",
    "고의사구": "고의 4구"
]

/// 예외처리 및 자막에서 용어 변환 함수
func getTermDescription(networkTranscript: NetworkTranscript) -> [TranscriptItem]? {
    var transcriptItems: [TranscriptItem] = []
    
    for transcript in networkTranscript.videoTranscript {
        let term = transcript.text
        let start = transcript.start
        let fixedId = "\(term)-\(start)"

        for definedTerm in termDictionary.keys {
            if term.contains(definedTerm) {
                if let description = termDictionary[definedTerm] {
                    let item = TranscriptItem(id: fixedId, text: definedTerm, description: description, start: start)
                    transcriptItems.append(item)
                }
            }
        }

        for normalizedTerm in normalizedTerms.keys {
            if term.contains(normalizedTerm) {
                let originalTerm = normalizedTerms[normalizedTerm] ?? normalizedTerm
                if let description = termDictionary[originalTerm] {
                    let item = TranscriptItem(id: fixedId, text: originalTerm, description: description, start: start)
                    transcriptItems.append(item)
                }
            }
        }
    }
    return transcriptItems.isEmpty ? nil : transcriptItems
}

/// 검색한 자막 필터링 함수
func filterItems(by searchText: String, networkTranscript: NetworkTranscript) -> [VideoTranscriptItem]? {
    return networkTranscript.videoTranscript
        .filter { $0.text.lowercased().contains(searchText.lowercased()) }
        .map { item in
            var modifiedItem = item
            modifiedItem.id = "\(item.start)_\(item.text.hashValue)"
            return modifiedItem
        }
}
