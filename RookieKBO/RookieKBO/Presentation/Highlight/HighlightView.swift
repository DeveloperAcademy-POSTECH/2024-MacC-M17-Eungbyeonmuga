//
//  HighlightView.swift
//  RookieKBO
//
//  Created by Simmons on 11/7/24.
//

import SwiftUI

struct HighlightView: View {
    
    @Environment(HighlightUseCase.self) private var highlightUseCase
    @Environment(PathModel.self) private var pathModel
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var body: some View {
        ZStack {
            // 상단 배경
            Color(Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "") ?? .brandPrimary)
                .ignoresSafeArea(edges: .top)
            
            // 하단 배경
            Color.gray1
                .ignoresSafeArea(edges: .bottom)
                .offset(y: UIScreen.main.bounds.height / 3.5)
            
            HighlightContentView()
                .clipped()
        }
    }
}

// MARK: - HighlightContentView

private struct HighlightContentView: View {
    
    @Environment(HighlightUseCase.self) private var highlightUseCase
    @Environment(PathModel.self) private var pathModel
    
    private var filteredHighlights: [Highlight] {
        guard let selectedDate = highlightUseCase.state.selectedDate else {
            return highlightUseCase.state.HighlightInfo
        }
        return highlightUseCase.filterHighlights(for: selectedDate, in: highlightUseCase.state.HighlightInfo)
    }
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                Section(header: HighlightHeaderView()) {
                    
                    HighlightHeaderDetailView()
                    HighlightContentSettingView()
                    
                    ForEach(filteredHighlights, id: \.self) { info in
                        HighlightContent(videoInfo: info) {
                            highlightUseCase.updateSelectedeHighlight(highlight: info)
                            pathModel.push(.videoTranscript)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
                    
                    Spacer()
                        .frame(height: 24)
                }
            }
            .background(.gray1)
        }
    }
}

// MARK: - HighlightHeaderDetailView

private struct HighlightHeaderDetailView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("영상을 보면서 야구 용어를 학습하거나\n좋아하는 선수를 찾아보세요!")
                    .foregroundColor(.white0)
                    .font(.Head.head4)
                    .lineSpacing(6)
                
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
        }
        .background(Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? ""))
    }
}

// MARK: - HighlightContentSettingView

private struct HighlightContentSettingView: View {
    
    @Environment(HighlightUseCase.self) private var highlightUseCase
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    @State private var isShowingSetCalendar = false
    
    var body: some View {
        HStack(spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "baseball")
                    .font(.Caption.caption1)
                
                Text("전체 구단")
                    .font(.Body.body1)
            }
            .foregroundColor(.white0)
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 99)
                    .fill(Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? "") ?? .brandPrimary)
            )
            
            Spacer(minLength: 0)
            
            if highlightUseCase.state.selectedDate != nil {
                Button {
                    highlightUseCase.fetchSelectedDate(nil)
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .resizable()
                        .foregroundColor(.gray4)
                        .frame(width: 32, height: 32)
                }
            }
            
            Button {
                isShowingSetCalendar = true
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "calendar")
                        .font(.Caption.caption1)
                        .foregroundColor(.gray7)
                    
                    Text(highlightUseCase.state.selectedDate == nil ? "날짜" : "\(highlightUseCase.state.selectedDate!.toMonthDayString())")
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
        }
        .padding(.top, 8)
        .padding()
        .sheet(isPresented: $isShowingSetCalendar) {
            SetCalendarView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.height(535)])
        }
    }
}

// MARK: - SetCalendarView

private struct SetCalendarView: View {
    
    @Environment(HighlightUseCase.self) private var highlightUseCase
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    @Environment(\.presentationMode) var presentationMode
    
    @State private var currentDate = Date()
    @State private var isValidDate = false
    @State private var calendarColor: Color = .brandPrimary
    
    private var matchingHighlights: [Highlight] {
        highlightUseCase.filterHighlights(for: currentDate, in: highlightUseCase.state.HighlightInfo)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            DatePicker(
                "하이라이트 날짜 선택",
                selection: $currentDate,
                in: Date.regularSeasonStart...Date.postSeasonEnd,
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            .environment(\.locale, Locale(identifier: String(Locale.preferredLanguages[0])))
            .tint(calendarColor)
            
            Spacer()
            
            if isValidDate {
                Button {
                    highlightUseCase.fetchSelectedDate(currentDate)
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
            currentDate = highlightUseCase.state.selectedDate ?? Date()
            isValidDate = highlightUseCase.isValidDate(currentDate, from: highlightUseCase.state.HighlightInfo)
        }
        .onChange(of: currentDate) { newDate in
            isValidDate = highlightUseCase.isValidDate(newDate, from: highlightUseCase.state.HighlightInfo)
        }
    }
}

// MARK: - HighlightHeaderView

private struct HighlightHeaderView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("하이라이트")
                    .foregroundColor(.white0)
                    .font(.CustomTitle.customTitle2)
                
                Spacer()
            }
            .padding()
        }
        .background(Color.teamColor(for: selectTeamUseCase.state.selectedTeam?.color ?? ""))
    }
}

// MARK: - HighlightContent

private struct HighlightContent: View {
    
    @Environment(HighlightUseCase.self) private var highlightUseCase
    
    let videoInfo: Highlight
    let tapAction: () -> Void
    
    var body: some View {
        Button {
            tapAction()
        } label: {
            ZStack {
                AsyncImage(url: URL(string: videoInfo.thumbnail)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 203)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                } placeholder: {
                    ProgressView()
                        .frame(height: 203)
                }
                
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.black8)
                    .opacity(0.5)
                
                HStack(spacing: 8){
                    VStack(alignment: .leading, spacing: 0) {
                        Text(highlightUseCase.extractHomeAway(from: videoInfo.title))
                            .foregroundColor(.white0)
                            .font(.Head.head2)
                        
                        Text(videoInfo.date.replacingOccurrences(of: "-", with: "."))
                            .foregroundColor(.white0)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                }
                
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white0)
            }
        }
    }
}

#Preview {
    HighlightView()
        .environment(HighlightUseCase(highlightService: HighlightServiceImpl()))
        .environment(PathModel())
        .environment(SelectTeamUseCase(selectTeamService: SelectTeamServiceImpl()))
}
