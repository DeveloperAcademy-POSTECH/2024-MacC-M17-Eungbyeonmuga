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
                TranscriptItem(id: UUID(), text: "백투 홈런", start: 10.0),
                TranscriptItem(id: UUID(), text: "않타", start: 5.5),
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
    
    static var mockTranscriptList: [VideoTranscript] {
        return [
        VideoTranscript(
            videoId: "mock",
            transcript: [
                TranscriptItem(id: UUID(), text: "박성한이 백투백 홈런", start: 0.0),
                TranscriptItem(id: UUID(), text: "백투 홈런", start: 10.0),
                TranscriptItem(id: UUID(), text: "않타", start: 5.5),
                TranscriptItem(id: UUID(), text: "중견수", start: 15.5),
                TranscriptItem(id: UUID(), text: "박성한이 도루함", start: 12.0),
                TranscriptItem(id: UUID(), text: "도루", start: 22.0),
                TranscriptItem(id: UUID(), text: "박성한이 홈런", start: 20.0),
                TranscriptItem(id: UUID(), text: "홈런", start: 40.0),
                TranscriptItem(id: UUID(), text: "박성한이 사이클링 히트", start: 30.0),
                TranscriptItem(id: UUID(), text: "사이클링 히트", start: 100.0),
                TranscriptItem(id: UUID(), text: "사이클링 히트", start: 110.0),
            ]
        ),
        VideoTranscript(
            videoId: "8HyQHBYaROQ",
            transcript: [
                TranscriptItem(id: UUID(), text: "대망의 한국 시리즈 1차전 있니다", start: 33),
                    TranscriptItem(id: UUID(), text: "전통의 명문 두 팀의 꿈의 매치가", start: 35.6),
                    TranscriptItem(id: UUID(), text: "성사됐습니다 오른쪽 오 김근이", start: 39.8),
                    TranscriptItem(id: UUID(), text: "넘겼습니다 0대 0의 균형을 김원의", start: 43.68),
                    TranscriptItem(id: UUID(), text: "솔로", start: 47.16),
                    TranscriptItem(id: UUID(), text: "홈런으로입니다 9시 24분 멈춰섰던", start: 53.96),
                    TranscriptItem(id: UUID(), text: "시계가 다시 움직입니다", start: 57.039),
                    TranscriptItem(id: UUID(), text: "고 다시 볼 빠집니다 또 다시 볼이", start: 61.48),
                    TranscriptItem(id: UUID(), text: "빠졌습니다 3주자 홈까지 결국은", start: 63.76),
                    TranscriptItem(id: UUID(), text: "역전에 성공하는 기아 타이거입니다", start: 66.72),
                    TranscriptItem(id: UUID(), text: "우여곡절이 많았던 1차전이 이렇게", start: 70.88),
                    TranscriptItem(id: UUID(), text: "마무리가 됩니다 오늘에만 이제 두", start: 73.4),
                    TranscriptItem(id: UUID(), text: "경기를 치르게 되는 한국 시리즈예요는", start: 74.88),
                    TranscriptItem(id: UUID(), text: "김도영 선수가 들어섭니다", start: 77.479),
                    TranscriptItem(id: UUID(), text: "짝", start: 81.52),
                    TranscriptItem(id: UUID(), text: "넘어갑니다", start: 84.479),
                    TranscriptItem(id: UUID(), text: "김의 두 번째 승리 시리즈 초반부터", start: 86.68),
                    TranscriptItem(id: UUID(), text: "압하 있는", start: 90.159),
                    TranscriptItem(id: UUID(), text: "중입니다 바깥쪽 헛스윙", start: 95.56),
                    TranscriptItem(id: UUID(), text: "[음악]", start: 98.91),
                    TranscriptItem(id: UUID(), text: "웃가 좌장 넘어갑니다", start: 101.759),
                    TranscriptItem(id: UUID(), text: "이성규 오른쪽 자 김이", start: 105.079),
                    TranscriptItem(id: UUID(), text: "넘깁니다 터져야 될 박병호 선수까지", start: 109.159),
                    TranscriptItem(id: UUID(), text: "홈런이 졌거든요", start: 112.36),
                    TranscriptItem(id: UUID(), text: "[음악]", start: 118.09),
                    TranscriptItem(id: UUID(), text: "스윙", start: 120.84),
                    TranscriptItem(id: UUID(), text: "웃 당겼습니다 좌익수로 좌측 좌측 측", start: 127.08),
                    TranscriptItem(id: UUID(), text: "넘어갔습니다 측", start: 133.36),
                    TranscriptItem(id: UUID(), text: "넘어갑니다", start: 136),
                    TranscriptItem(id: UUID(), text: "홈 홈 왔습니다 홈입니다", start: 140.599),
                    TranscriptItem(id: UUID(), text: "지번 타자 김 4번 디아즈 5번 김웅", start: 150.48),
                    TranscriptItem(id: UUID(), text: "이번 포스트시즌 처음으로 선발로", start: 154.319),
                    TranscriptItem(id: UUID(), text: "등판하고 있는 좌투수 이승현입니다", start: 156.44),
                    TranscriptItem(id: UUID(), text: "박찬호 김빈 김도영 나성범 소크라테스", start: 158.879),
                    TranscriptItem(id: UUID(), text: "오늘 선발로 나서는 투수는 타이거즈의", start: 162.879),
                    TranscriptItem(id: UUID(), text: "대투수", start: 165.8),
                    TranscriptItem(id: UUID(), text: "[음악]", start: 171.19),
                    TranscriptItem(id: UUID(), text: "양입니다 낮게 통가지 않았습니다", start: 173.519),
                    TranscriptItem(id: UUID(), text: "스트레이트볼 그날 3타 3타를", start: 176.36),
                    TranscriptItem(id: UUID(), text: "기록했습니다", start: 178.4),
                    TranscriptItem(id: UUID(), text: "게 솟았습니다 좌익수 이창진이", start: 180.44),
                    TranscriptItem(id: UUID(), text: "잡아냈습니다 원 아웃 이구 몸적", start: 182.959),
                    TranscriptItem(id: UUID(), text: "김지찬은 뛰었습니다 타자는 때렸고이", start: 186.08),
                    TranscriptItem(id: UUID(), text: "타구의 센터 쪽 중견수가 기다리고", start: 188.959),
                    TranscriptItem(id: UUID(), text: "있습니다 1기로 하고 있는 김지찬", start: 190.64),
                    TranscriptItem(id: UUID(), text: "1기로 합니다 투의", start: 193.36),
                    TranscriptItem(id: UUID(), text: "볼카운트 걷어 올렸습니다", start: 196.959),
                    TranscriptItem(id: UUID(), text: "오른쪽 탐을", start: 202.2),
                    TranscriptItem(id: UUID(), text: "없니다", start: 205.319),
                    TranscriptItem(id: UUID(), text: "루티아 선점을 기록하고 있는 삼성", start: 207.439),
                    TranscriptItem(id: UUID(), text: "라이온즈 자 티아즈 선수가 불리한", start: 212.239),
                    TranscriptItem(id: UUID(), text: "볼카운트 속에서 자 바깥쪽에 빠른 공", start: 215.72),
                    TranscriptItem(id: UUID(), text: "그 이후에 슬라이더를 잘 참아주면서", start: 218.76),
                    TranscriptItem(id: UUID(), text: "야 서치 득점을 만들어내는 이점", start: 221.64),
                    TranscriptItem(id: UUID(), text: "홈런을 때려내 한국 시리즈의 첫 홈런", start: 224.4),
                    TranscriptItem(id: UUID(), text: "오늘 5차전 선치 득점으로 연결되고", start: 228.12),
                    TranscriptItem(id: UUID(), text: "있습니다 더군다나 지금 코리안 시리즈", start: 231.56),
                    TranscriptItem(id: UUID(), text: "1차전을 제외하고는 들어올렸습니다이", start: 234.68),
                    TranscriptItem(id: UUID(), text: "타구도 우중간 쪽으로 날아가는데", start: 237.599),
                    TranscriptItem(id: UUID(), text: "아", start: 240.36),
                    TranscriptItem(id: UUID(), text: "자습니다 백투 홈런 삼성", start: 244.239),
                    TranscriptItem(id: UUID(), text: "라이언 스코어", start: 247.72),
                    TranscriptItem(id: UUID(), text: "3대 자 김영웅", start: 251.84),
                    TranscriptItem(id: UUID(), text: "선수가이 전에 파워를 친 것도 사실은", start: 255.04),
                    TranscriptItem(id: UUID(), text: "슬라이드 있는데 타이밍이 그렇게", start: 257.759),
                    TranscriptItem(id: UUID(), text: "나쁘지 않았어요 똑같이 김영호 선수는", start: 260.239),
                    TranscriptItem(id: UUID(), text: "디아 선수와 마찬가지로 좋은", start: 263.72),
                    TranscriptItem(id: UUID(), text: "타이밍에서 슬라이더를 홈으로", start: 266.24),
                    TranscriptItem(id: UUID(), text: "만들어냅니다 이것이 바로 삼성", start: 268.72),
                    TranscriptItem(id: UUID(), text: "라이온즈의 저력입니다", start: 271.36),
                    TranscriptItem(id: UUID(), text: "자기의 최고 구속이 계속해서 나올", start: 275.8),
                    TranscriptItem(id: UUID(), text: "수밖에 없는", start: 278.199),
                    TranscriptItem(id: UUID(), text: "날이에요 자 2루수가 잡아냈고 루에", start: 281),
                    TranscriptItem(id: UUID(), text: "헤드", start: 284.56),
                    TranscriptItem(id: UUID(), text: "슬라이딩 내 한타를 만들어내고 있는", start: 286.24),
                    TranscriptItem(id: UUID(), text: "박찬호 자 우익수 쪽으로 충분히", start: 288.6),
                    TranscriptItem(id: UUID(), text: "빠져나가는 타데 자 이걸 유지혁", start: 290.84),
                    TranscriptItem(id: UUID(), text: "선수가 정말 끝까지 쫓아가서 자르는", start: 293.56),
                    TranscriptItem(id: UUID(), text: "데까지 성공을 했거든요 하지만 발", start: 296.759),
                    TranscriptItem(id: UUID(), text: "타자주자 박찬호 선수를 잡기에는", start: 299.68),
                    TranscriptItem(id: UUID(), text: "역부족이었어요", start: 301.4),
                    TranscriptItem(id: UUID(), text: "[박수]", start: 302.1),
                    TranscriptItem(id: UUID(), text: "칼이 넘는 타를 기록하고 있는 김선민", start: 303.36),
                    TranscriptItem(id: UUID(), text: "선수예요 아 못 맞는 공이", start: 306.039),
                    TranscriptItem(id: UUID(), text: "나왔습니다 PS 전반적으로 놓고 봐도", start: 308.639),
                    TranscriptItem(id: UUID(), text: "잡아당겼는데 삼루수 김영웅 잡아서", start: 312.68),
                    TranscriptItem(id: UUID(), text: "이루 포스 아웃 그리고 1루", start: 314.84),
                    TranscriptItem(id: UUID(), text: "1루에서는 세입니다 타석에는 나성범", start: 316.56),
                    TranscriptItem(id: UUID(), text: "선수가 들어왔습니다 성적보다 이번", start: 319.4),
                    TranscriptItem(id: UUID(), text: "시즌 타국가 분전하고 있는 나성", start: 322.28),
                    TranscriptItem(id: UUID(), text: "범인인데 들어올렸고 자 높게 타고만", start: 324),
                    TranscriptItem(id: UUID(), text: "상당히 거리가 짧은 타구요 왼쪽", start: 327.24),
                    TranscriptItem(id: UUID(), text: "좌익수가 잡아냈습니다 홈으로 홈으로", start: 330),
                    TranscriptItem(id: UUID(), text: "볼 연결 홈에 홈에서 들어왔습니다", start: 332.199),
                    TranscriptItem(id: UUID(), text: "히아 타이거즈가 득점을 만들어냈습니다", start: 336.08),
                    TranscriptItem(id: UUID(), text: "스코어 3대", start: 338.479),
                    TranscriptItem(id: UUID(), text: "1 잘 받아 때렸습니다 센터 쪽", start: 341.36),
                    TranscriptItem(id: UUID(), text: "중견수 앞에 떨어지는", start: 344.039),
                    TranscriptItem(id: UUID(), text: "난타 주자가 두 명으로 불어나고 있는", start: 345.639),
                    TranscriptItem(id: UUID(), text: "기아", start: 348),
                    TranscriptItem(id: UUID(), text: "타이거즈 지금이네요", start: 348.84),
                    TranscriptItem(id: UUID(), text: "몸쪽으로 붙어 안았고 최영은 방망이를", start: 351.36),
                    TranscriptItem(id: UUID(), text: "돌렸습니다 높게 솟아오른 타구는 왼쪽", start: 354.68),
                    TranscriptItem(id: UUID(), text: "좌익수 김원이 잡아냈습니다 웃 이닝", start: 357.319),
                    TranscriptItem(id: UUID(), text: "종료 잘르는 2루와 1루 하지만 실점", start: 360.68),
                    TranscriptItem(id: UUID(), text: "이후에 곧바로 한 점을 따라붙었던", start: 363.44),
                    TranscriptItem(id: UUID(), text: "기아 타이거입니다", start: 365.639),
                    TranscriptItem(id: UUID(), text: "[박수]", start: 369.21),
                    TranscriptItem(id: UUID(), text: "[음악]", start: 370.42),
                    TranscriptItem(id: UUID(), text: "4구 지켜보면 스트레이트", start: 372.84),
                    TranscriptItem(id: UUID(), text: "[음악]", start: 375.95),
                    TranscriptItem(id: UUID(), text: "볼넷 2구 잡아당겼습니다 왼쪽으로", start: 378.4),
                    TranscriptItem(id: UUID(), text: "날아가는데 원바운드로 장을 때립니다", start: 382.16),
                    TranscriptItem(id: UUID(), text: "장성", start: 385),
                    TranscriptItem(id: UUID(), text: "코스 이창 3루 하자 주자 박찬호는", start: 386.52),
                    TranscriptItem(id: UUID(), text: "1루까지 주자 득점권에 두 명을 갖게", start: 390.88),
                    TranscriptItem(id: UUID(), text: "되는 게야", start: 393.44),
                    TranscriptItem(id: UUID(), text: "타이거즈 천 선민이 갔다 맞췄는데", start: 396.56),
                    TranscriptItem(id: UUID(), text: "오른쪽 루수가 잡아냈습니다 지역의", start: 400.919),
                    TranscriptItem(id: UUID(), text: "파인플레이 주자 득점권 두명 하지만", start: 405.08),
                    TranscriptItem(id: UUID(), text: "실점하지 않았던 수비 집중력의 삼성", start: 408.08),
                    TranscriptItem(id: UUID(), text: "라이언즈 있습니다 점수는 여전히 3대", start: 410.96),
                    TranscriptItem(id: UUID(), text: "1입니다 방입니다", start: 412.8),
                    TranscriptItem(id: UUID(), text: "[음악]", start: 418.22),
                    TranscriptItem(id: UUID(), text: "걷어 올렸습니다 우중간 쪽으로", start: 421.96),
                    TranscriptItem(id: UUID(), text: "야수들이 보이고 있는데요 그 사이에", start: 424.319),
                    TranscriptItem(id: UUID(), text: "떨어졌습니다 중견수와 우익수 사이에", start: 427.44),
                    TranscriptItem(id: UUID(), text: "타구를 날려 보냈었던 류지혁", start: 430),
                    TranscriptItem(id: UUID(), text: "끌어갑니다", start: 432.24),
                    TranscriptItem(id: UUID(), text: "[박수]", start: 433.06),
                    TranscriptItem(id: UUID(), text: "몸쪽 들어왔습니다 지켜보면서 진남 자", start: 434.84),
                    TranscriptItem(id: UUID(), text: "지금 조음 전에 디아지 선수의 이번", start: 439),
                    TranscriptItem(id: UUID(), text: "포스 시즌 기록들이 나오는데네 어", start: 441.319),
                    TranscriptItem(id: UUID(), text: "화려하네요", start: 444.24),
                    TranscriptItem(id: UUID(), text: "아 은공을 요구했고 이번에도", start: 448.52),
                    TranscriptItem(id: UUID(), text: "오른쪽으로 장을", start: 453.96),
                    TranscriptItem(id: UUID(), text: "[박수]", start: 456.31),
                    TranscriptItem(id: UUID(), text: "넘깁니다 루앤 디아즈의", start: 457.919),
                    TranscriptItem(id: UUID(), text: "연타석포 어게인 2013을 꿈꾸는", start: 462.479),
                    TranscriptItem(id: UUID(), text: "외국인 타자 루앤", start: 466.44),
                    TranscriptItem(id: UUID(), text: "디아제 자 첫 타석에는 결의", start: 470.039),
                    TranscriptItem(id: UUID(), text: "슬라이드를 완벽한 타이밍에서 받아친", start: 472.639),
                    TranscriptItem(id: UUID(), text: "이정 홈런 그리고 이번 타석에서 초구", start: 474.68),
                    TranscriptItem(id: UUID(), text: "슬라이드를 지켜본 이후에 2구째 빠른", start: 477.72),
                    TranscriptItem(id: UUID(), text: "공을 완벽한 타이밍에 다시 한번", start: 480.8),
                    TranscriptItem(id: UUID(), text: "넘기는 디아즈", start: 483.28),
                    TranscriptItem(id: UUID(), text: "선수입니다 더 아웃 분위기를", start: 485.199),
                    TranscriptItem(id: UUID(), text: "끌어올리고 있는이 선수 루인", start: 487.44),
                    TranscriptItem(id: UUID(), text: "디아스입니다", start: 490.52),
                    TranscriptItem(id: UUID(), text: "그리고 양현종 선수는이 순간에", start: 491.8),
                    TranscriptItem(id: UUID(), text: "마운드를 내려가고 있습니다네 기안의", start: 494.759),
                    TranscriptItem(id: UUID(), text: "박긴 투수는 김도현", start: 497.599),
                    TranscriptItem(id: UUID(), text: "선수입니다 3구 받다 때렸습니다", start: 501.879),
                    TranscriptItem(id: UUID(), text: "왼쪽으로 높게 떠서 날아가는데 왼쪽", start: 504.199),
                    TranscriptItem(id: UUID(), text: "좌익수가 잡아냅니다", start: 507.96),
                    TranscriptItem(id: UUID(), text: "슈퍼 캐치가 나면서 이렇게 1", start: 510.879),
                    TranscriptItem(id: UUID(), text: "종료 아마도 조금 심적으로 더", start: 515.68),
                    TranscriptItem(id: UUID(), text: "공격적으로 들어갈 수 있는 명분이", start: 519.44),
                    TranscriptItem(id: UUID(), text: "생겼어요 센터 내를 건너가는 타", start: 521.24),
                    TranscriptItem(id: UUID(), text: "선두타자 타출 하고 있는 기아타이거즈", start: 524.12),
                    TranscriptItem(id: UUID(), text: "자 정규 시즌에서는 좀처럼 던지지", start: 527.279),
                    TranscriptItem(id: UUID(), text: "않았던 좌타자에게 체인지업을 확실하게", start: 529.8),
                    TranscriptItem(id: UUID(), text: "그런", start: 532.92),
                    TranscriptItem(id: UUID(), text: "어떤을", start: 535),
                    TranscriptItem(id: UUID(), text: "수 렸는데요 하늘 높게 야수들이", start: 538.44),
                    TranscriptItem(id: UUID(), text: "달려나오고 있는데 그 사이에", start: 542.2),
                    TranscriptItem(id: UUID(), text: "떨어집니다 두 타자 연속 타기야", start: 545.04),
                    TranscriptItem(id: UUID(), text: "타이지 근데 이재현 선수의 어떤", start: 547.6),
                    TranscriptItem(id: UUID(), text: "모습을 보면서 자신이 이제 어떤 코를", start: 550.2),
                    TranscriptItem(id: UUID(), text: "하고 들어오지 못했죠", start: 552.92),
                    TranscriptItem(id: UUID(), text: "[음악]", start: 555.88),
                    TranscriptItem(id: UUID(), text: "아 변하고 땅볼 투수 잡아서 이루", start: 558.079),
                    TranscriptItem(id: UUID(), text: "포스 주자 양을 위치하고 있는 기아", start: 563.44),
                    TranscriptItem(id: UUID(), text: "타이거입니다", start: 566.12),
                    TranscriptItem(id: UUID(), text: "[음악]", start: 567.24),
                    TranscriptItem(id: UUID(), text: "최영우 끌어당겼고 1 2간", start: 569.76),
                    TranscriptItem(id: UUID(), text: "빠져나갑니다", start: 571.839),
                    TranscriptItem(id: UUID(), text: "3루주자를 홈으로 불러들이는 최우의", start: 573),
                    TranscriptItem(id: UUID(), text: "적시타 간격이 좁혀지고 있습니다", start: 575.56),
                    TranscriptItem(id: UUID(), text: "점수는 5대", start: 578),
                    TranscriptItem(id: UUID(), text: "[박수]", start: 579.29),
                    TranscriptItem(id: UUID(), text: "[음악]", start: 580.83),
                    TranscriptItem(id: UUID(), text: "2 바깥쪽 변화구에 꽁꽁 얼어붙습니다", start: 582.2),
                    TranscriptItem(id: UUID(), text: "삼진 타자로서는 뭐 건드릴 수가 없는", start: 586.6),
                    TranscriptItem(id: UUID(), text: "그런 공이", start: 590),
                    TranscriptItem(id: UUID(), text: "들어왔어요 카를 잘 수행해주고", start: 591.079),
                    TranscriptItem(id: UUID(), text: "있습니다 석에는", start: 594.279),
                    TranscriptItem(id: UUID(), text: "김태이 수와 포스 1루에 아웃입니다", start: 598.32),
                    TranscriptItem(id: UUID(), text: "이렇게 잘 누워는 2루와", start: 602.48),
                    TranscriptItem(id: UUID(), text: "1루 확실하게 앞쪽에서 히팅 포인트를", start: 607.279),
                    TranscriptItem(id: UUID(), text: "지금 잡아놓고 치고", start: 610.279),
                    TranscriptItem(id: UUID(), text: "있어요 잡아당겼습니다 유격수 키를", start: 611.92),
                    TranscriptItem(id: UUID(), text: "[박수]", start: 615.73),
                    TranscriptItem(id: UUID(), text: "넘깁니다 스트레이트", start: 619.32),
                    TranscriptItem(id: UUID(), text: "볼넷 떨어지는 공 반응하지 않았습니다", start: 623.8),
                    TranscriptItem(id: UUID(), text: "주자 풀베이스", start: 627.12),
                    TranscriptItem(id: UUID(), text: "자 정대현 수석 코치가 마운드를 공을", start: 629.72),
                    TranscriptItem(id: UUID(), text: "진 채 방문했습니다 삼성 라이언즈의", start: 633),
                    TranscriptItem(id: UUID(), text: "박긴 투수는 김태훈", start: 636.36),
                    TranscriptItem(id: UUID(), text: "선수입니다 4구 땅 볼입니다", start: 640.72),
                    TranscriptItem(id: UUID(), text: "류지 1루에 던지면서 쓰 아웃 이닝", start: 644.279),
                TranscriptItem(id: UUID(), text: "종료 잘 르는", start: 647.16)
                ]
            )
        ]
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
                title: "[KBO 하이라이트] 10.21, 23 삼성 vs KIA | KS 1차전 | 2024 KBO 포스트시즌 | 야구",
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
