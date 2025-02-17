//
//  OffSeasonView.swift
//  RookieKBO
//
//  Created by Simmons on 11/13/24.
//

import SwiftUI

struct OffSeasonView: View {
    
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(MatchUseCase.self) private var matchUseCase
    
    var currentTeam: Team? { selectTeamUseCase.state.selectedTeam }
    
    var body: some View {
        ZStack {
            // 상단 배경
            Color.teamColor(for: currentTeam?.color ?? "")
                .ignoresSafeArea()
            
            // 하단 배경
            Color.gray1
                .ignoresSafeArea(edges: .bottom)
                .offset(y: UIScreen.main.bounds.height / 2)
            
            GameInfoView()
                .clipped()
        }
    }
}

// MARK: - GameInfoView

private struct GameInfoView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var currentTeam: Team? { selectTeamUseCase.state.selectedTeam }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                Image(currentTeam?.backgroundImage ?? "allTeamBg")
                    .resizable()
                    .scaledToFit()
                    .offset(
                        currentTeam?.name == "전체 구단"
                        ? CGSize(width: 0, height: -52)
                        : CGSize(width: 0, height: -16)
                    )
                
                Color.gray1
                    .offset(y: UIScreen.main.bounds.height / 2)
                
                LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                    if currentTeam?.name != "전체 구단" {
                        HStack(spacing: 0) {
                            Image(.titleLogoWhite)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 4)
                    }
                    Section(header: HeaderView()) {
                        OffSeasonInfoView()
                        ContentView()
                    }
                }
            }
        }
    }
}

// MARK: - HeaderView

private struct HeaderView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var currentTeam: Team? { selectTeamUseCase.state.selectedTeam }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                if currentTeam?.name == "전체 구단" {
                    Image(.titleLogoWhite)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140)
                } else {
                    Text(currentTeam?.name ?? "SSG 랜더스")
                        .font(.CustomTitle.customTitle1)
                        .foregroundColor(.white0)
                }
                
                Spacer()
            }
            .padding()
            .padding(.top, -8)
        }
        .background(Color.teamColor(for: currentTeam?.color ?? ""))
    }
}

// MARK: - OffSeasonInfoView

private struct OffSeasonInfoView: View {
    
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(RankUseCase.self) private var rankUseCase
    
    var currentTeam: Team? { selectTeamUseCase.state.selectedTeam }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 133)
            
            HStack(spacing: 8) {
                ScalableButton {
                    pathModel.presentSheet(.dDaySheet)
                } label: {
                    HStack(spacing: 8) {
                        Text("KBO 개막")
                        Rectangle()
                            .frame(width: 2, height: 16)
                        Text((Date().getDdayToOpeningDate()))
                    }
                    .font(.Body.body1)
                    .foregroundColor(.white0)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(RoundedRectangle(cornerRadius: 16)
                        .fill(Color.teamGdColor(for: currentTeam?.color ?? "") ?? .brandPrimaryGd).opacity(0.8))
                }
                .disabled(selectTeamUseCase.isSheet)
                
                ScalableButton {
                    pathModel.presentSheet(.teamRanking)
                } label: {
                    HStack(spacing: 8) {
                        Text("순위")
                        Rectangle()
                            .frame(width: 2, height: 16)
                        
                        // 순위 애니메이션 적용
                        if let teamRanks = rankUseCase.state.teamRanks, !teamRanks.isEmpty {
                            GeometryReader { geometry in
                                VStack(spacing: 0) {
                                    ForEach(0..<teamRanks.count, id: \.self) { index in
                                        let teamRank = teamRanks[index]
                                        Text("\(teamRank.rank)위 \(teamRank.team)")
                                    }
                                }
                                .offset(y: -CGFloat(rankUseCase.currentRankIndex) * geometry.size.height)
                                .animation(.easeInOut(duration: 0.5), value: rankUseCase.currentRankIndex)
                            }
                            .clipped()
                        } else {
                            Spacer(minLength: 0)
                            ProgressView()
                                .tint(.white0)
                            Spacer(minLength: 0)
                        }
                    }
                    .font(.Body.body1)
                    .foregroundColor(.white0)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 150)
                    .background(RoundedRectangle(cornerRadius: 16)
                        .fill(Color.teamGdColor(for: currentTeam?.color ?? "") ?? .brandPrimaryGd).opacity(0.8))
                }
                .disabled(selectTeamUseCase.isSheet)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            .padding(.bottom, 24)
        }
        .onAppear {
            Task {
//                await rankUseCase.fetchRanks()
                rankUseCase.startTimer()
            }
        }
        .onDisappear {
            rankUseCase.stopTimer()
        }
    }
}

// MARK: - ContentView

private struct ContentView: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(NewsUseCase.self) private var newsUseCase
    @Environment(\.openURL) private var openURL
    
    var currentTeam: Team? { selectTeamUseCase.state.selectedTeam }
    
    // 종료된 우리 팀 경기
    var myTeamEndGames: [Match] {
        filteredGames(myTeamGames: true).filter { $0.gameState == .END }
    }
    
    // 취소된 우리 팀 경기
    var myTeamCancelGames: [Match] {
        filteredGames(myTeamGames: true).filter { $0.gameState == .CANCEL }
    }
    
    // 종료된 다른 팀 경기
    var otherTeamEndGames: [Match] {
        filteredGames(myTeamGames: false).filter { $0.gameState == .END }
    }
    
    // 취소된 다른 팀 경기
    var otherTeamCancelGames: [Match] {
        filteredGames(myTeamGames: false).filter { $0.gameState == .CANCEL }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            DateInfoView()
            // 로딩 중일 때 표시할 뷰
            if matchUseCase.isLoading {
                ProgressView()
                    .padding(.vertical, 40)
                    .background(.gray1)
            } else {
                if matchUseCase.getSeason() != "TODAY" {
                    HStack(spacing: 0) {
                        Text(currentTeam?.name == "전체 구단" ? "종료된 경기" : "종료된 우리팀 경기")
                            .font(.Body.body1)
                            .foregroundColor(.gray7)
                        
                        Spacer()
                        
                        Text("스탯티즈 출처")
                            .font(.Body.body5)
                            .foregroundColor(.gray5)
                    }
                    .padding(.vertical)
                    
                    if myTeamEndGames.isEmpty && myTeamCancelGames.isEmpty {
                        VStack(spacing: 0) {
                            Image(selectTeamUseCase.state.selectedTeam?.image ?? "allTeamUnder")
                                .resizable()
                                .frame(width: 96, height: 96)
                            
                            Text(currentTeam?.name == "전체 구단" ? "경기가 없었어요!" : "우리팀 경기가 없었어요!")
                                .font(.Head.head5)
                                .foregroundColor(.gray5)
                                .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: 24)
                            .fill(.white0))
                        
                    } else {
                        ForEach(myTeamEndGames) { game in
                            EndGameInfo(endGameInfo: game)
                                .padding(.bottom, 4)
                        }
                        
                        ForEach(myTeamCancelGames) { game in
                            CancelGameInfo(cancelGameInfo: game)
                                .padding(.bottom, 4)
                        }
                    }
                    
                    if currentTeam?.name != "전체 구단" && (!otherTeamEndGames.isEmpty || !otherTeamCancelGames.isEmpty) {
                        HStack(spacing: 0) {
                            Text("종료된 다른팀 경기")
                                .font(.Body.body1)
                                .foregroundColor(.gray7)
                            
                            Spacer()
                            
                            Text("스탯티즈 출처")
                                .font(.Body.body5)
                                .foregroundColor(.gray5)
                        }
                        .padding(.vertical)
                        
                        ForEach(otherTeamEndGames) { game in
                            EndGameInfo(endGameInfo: game)
                                .padding(.bottom, 8)
                        }
                        
                        ForEach(otherTeamCancelGames) { game in
                            CancelGameInfo(cancelGameInfo: game)
                                .padding(.bottom, 8)
                        }
                    }
                } else {
                    HStack(spacing: 0) {
                        Text("비시즌 KBO NEWS")
                            .font(.Body.body1)
                            .foregroundColor(.gray7)
                        
                        Spacer()
                        
                        Text("스탯티즈 출처")
                            .font(.Body.body5)
                            .foregroundColor(.gray5)
                    }
                    .padding(.vertical)
                    
                    if newsUseCase.state.totalNews.isEmpty {
                        Spacer()
                        ProgressView()
                            .tint(Color.teamColor(for: currentTeam?.color ?? "allTeam"))
                        Spacer()
                    } else {
                        ForEach(newsUseCase.state.totalNews[0..<4]) { news in
                            NewsBoard(newsInfo: news) {
                                openURL(URL(string: news.link)!)
                            }
                            .padding(.bottom)
                        }
                    }
                }
            }
        }
        .padding()
        .background(.gray1)
//        .onAppear {
//            Task {
//                await newsUseCase.fetchNews()
//            }
//        }
    }
    
    private func filteredGames(myTeamGames: Bool) -> [Match] {
        matchUseCase.matches.filter { game in
            // 모든 게임이 과거 날짜인지 확인
            matchUseCase.isDateInPast(game.startDateTime)
        }
        .filter { game in
            guard let selectedDate = matchUseCase.selectedDate else { return true }
            // startDateTime에서 4시간 빼서 해당 날짜에 띄우기
            guard let adjustedStartDateTime = Calendar.current.date(byAdding: .hour, value: -4, to: game.startDateTime) else {
                return false
            }
            return Calendar.current.isDate(adjustedStartDateTime, inSameDayAs: selectedDate)
        }
        .filter { game in
            guard let selectedTeam = selectTeamUseCase.state.selectedTeam else { return false }
            
            if selectedTeam.name == "전체 구단" {
                // 전체 구단 선택 시 모든 게임 포함 또는 제외
                return myTeamGames
            } else {
                // 선택된 팀과 관련된 게임만 포함하거나 제외
                let isMyTeamGame = matchUseCase.isMyTeam(game.homeTeam, selectedTeam) || matchUseCase.isMyTeam(game.awayTeam, selectedTeam)
                return myTeamGames ? isMyTeamGame : !isMyTeamGame
            }
        }
    }
}

// MARK: - DateInfoView

private struct DateInfoView: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    @State private var isShowingSetCalendar = false
    
    var body: some View {
        HStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 8) {
                Text(matchUseCase.selectedDate == nil ? Date().toMonthDayString() : matchUseCase.selectedDate!.toMonthDayString())
                    .font(.CustomTitle.customTitle2)
                    .foregroundColor(.gray7)
                
                Text(matchUseCase.getSeason())
                    .font(.Head.head4b)
                    .foregroundColor(.gray5)
                    .padding(.bottom, 4)
            }
            
            Spacer(minLength: 0)
            
            if matchUseCase.selectedDate != nil {
                ScalableButton {
                    matchUseCase.fetchSelectedDate(nil)
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .resizable()
                        .foregroundColor(.gray4)
                        .frame(width: 32, height: 32)
                }
                .padding(.trailing, 8)
            }
            
            ScalableButton {
                isShowingSetCalendar = true
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "calendar")
                        .font(.Caption.caption1)
                        .foregroundColor(.gray7)
                    
                    Text(matchUseCase.selectedDate == nil ? "날짜" : "\(matchUseCase.selectedDate!.toMonthDayString())")
                        .font(.Body.body1)
                        .foregroundColor(.gray7)
                        .frame(minWidth: 44)
                    
                    Image(systemName: "chevron.down")
                        .font(.Caption.caption1)
                        .foregroundColor(.gray5)
                }
                .padding(.vertical, 12)
                .padding(.leading, 20)
                .padding(.trailing, 14)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.black8.opacity(0.05))
                            .blur(radius: 10)
                        
                        RoundedRectangle(cornerRadius: 99)
                            .fill(.white0)
                    }
                )
            }
            .disabled(selectTeamUseCase.isSheet)
        }
        .padding(.bottom, 8)
        .sheet(isPresented: $isShowingSetCalendar) {
            SetCalendarView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.height(535)])
        }
    }
}

// MARK: - SetCalendarView

private struct SetCalendarView: View {
    
    @Environment(MatchUseCase.self) private var matchUseCase
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(\.presentationMode) var presentationMode
    
    @State private var currentDate = Date()
    @State private var isValidDate = false
    @State private var calendarColor: Color = .brandPrimary
    
    var body: some View {
        VStack(spacing: 0) {
            DatePicker(
                "경기 날짜 선택",
                selection: $currentDate,
                in: Date.regularSeasonStart...Date.postSeasonEnd,
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            .environment(\.locale, Locale(identifier: String(Locale.preferredLanguages[0])))
            .tint(calendarColor)
            
            Spacer()
            
            if isValidDate {
                ScalableButton {
                    Task {
                        matchUseCase.isLoadingToggle()
                        await matchUseCase.fetchMatches(date: currentDate.toFormattedString())
                        matchUseCase.isLoadingToggle()
                    }
                    matchUseCase.fetchSelectedDate(currentDate)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("이 날의 경기 정보를 볼래요!")
                        .font(.Head.head3)
                        .frame(width: 361, height: 54)
                        .foregroundColor(.white0)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(selectTeamUseCase.state.selectedTeam?.name == "전체 구단" ?
                                      LinearGradient.gradient(
                                        startColor: .brandPrimary,
                                        endColor: .brandPrimaryGd
                                      ) : LinearGradient.gradient(
                                        startColor: calendarColor,
                                        endColor: calendarColor
                                      )
                                     )
                        )
                }
                .padding(.vertical)
            } else {
                Text("이 날은 경기가 없어요!")
                    .font(.Head.head3)
                    .frame(width: 361, height: 54)
                    .foregroundColor(.white0)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.gray4))
                    .padding(.vertical)
            }
        }
        .padding()
        .onAppear {
            calendarColor = Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "") ?? .brandPrimary
            currentDate = matchUseCase.selectedDate ?? Date.postSeasonEnd
            isValidDate = matchUseCase.isValidDate(currentDate)
            selectTeamUseCase.isSheetToggle()
        }
        .onChange(of: currentDate) { newDate in
            isValidDate = matchUseCase.isValidDate(currentDate)
        }
        .onDisappear {
            selectTeamUseCase.isSheetToggle()
        }
    }
}

#Preview {
    OffSeasonView()
        .environment(PathModel())
        .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
        .environment(MatchUseCase(matchService: MatchServiceImpl()))
        .environment(RankUseCase(rankService: RankServiceImpl()))
        .environment(NewsUseCase(newsService: NewsServiceImpl()))
}
