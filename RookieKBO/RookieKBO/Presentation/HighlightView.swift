//
//  HighlightView.swift
//  RookieKBO
//
//  Created by Simmons on 11/7/24.
//

import SwiftUI

struct HighlightView: View {
    
    @Environment(HighlightUseCase.self) private var highlightUseCase
    
    var body: some View {
        ZStack {
            // 상단 배경
            Color.brandPrimary
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
    
    // TODO: API 연결 이후 삭제 예정 -> UseCase 사용해서 State로 저장해야함
    let highlightInfo = MockDataBuilder.mockHighlightInfo
    
    private var filteredHighlights: [Highlight] {
        guard let selectedDate = highlightUseCase.state.selectedDate else {
            return highlightInfo
        }
        return highlightUseCase.filterHighlights(for: selectedDate, in: highlightInfo)
    }
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                Section(header: HighlightHeaderView()) {
                    
                    HighlightHeaderDetailView()
                    HighlightContentSettingView()
                    
                    ForEach(filteredHighlights, id: \.self) { info in
                        HighlightContent(videoInfo: info) {
                            // TODO: 자막 페이지로 이동
                            print("TODO: 자막 페이지로 이동 \(info.videoId)")
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
        .background(.brandPrimary)
    }
}

// MARK: - HighlightContentSettingView

private struct HighlightContentSettingView: View {
    
    @Environment(HighlightUseCase.self) private var highlightUseCase
    
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
                    .fill(.brandPrimary)
            )
            
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
                    
                    Image(systemName: "chevron.down")
                        .font(.Caption.caption1)
                        .foregroundColor(.gray5)
                }
                .padding(.vertical, 12)
                .padding(.leading, 20)
                .padding(.trailing, 14)
                .background(
                    RoundedRectangle(cornerRadius: 99)
                        .fill(.white0)
                        .stroke(.gray2, lineWidth: 2)
                )
            }
            
            if highlightUseCase.state.selectedDate != nil {
                Button {
                    highlightUseCase.fetchSelectedDate(nil)
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.Caption.caption1)
                            .foregroundColor(.gray7)
                        
                        Text("오늘")
                            .font(.Body.body1)
                            .foregroundColor(.gray7)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 99)
                            .fill(.white0)
                            .stroke(.gray2, lineWidth: 2)
                    )
                }
            }
            
            Spacer(minLength: 0)
        }
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
    @Environment(\.presentationMode) var presentationMode
    
    @State private var currentDate = Date()
    @State private var isValidDate = false
    
    // TODO: API 연결 이후 삭제 예정 -> UseCase 사용해서 State로 저장해야함
    let highlightInfo = MockDataBuilder.mockHighlightInfo
    
    private var matchingHighlights: [Highlight] {
        highlightUseCase.filterHighlights(for: currentDate, in: highlightInfo)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            DatePicker(
                "하이라이트 날짜 선택",
                selection: $currentDate,
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            .environment(\.locale, Locale(identifier: String(Locale.preferredLanguages[0])))
            .tint(.brandPrimary)
            .onAppear {
                currentDate = highlightUseCase.state.selectedDate ?? Date()
                isValidDate = highlightUseCase.isValidDate(currentDate, from: highlightInfo)
            }
            .onChange(of: currentDate) { newDate in
                isValidDate = highlightUseCase.isValidDate(newDate, from: highlightInfo)
            }
            
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
                                .fill(
                                    LinearGradient.gradient(
                                        startColor: .brandPrimary,
                                        endColor: .brandPrimaryGd
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
    }
}

// MARK: - HighlightHeaderView

private struct HighlightHeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("하이라이트")
                    .foregroundColor(.white0)
                    .font(.CustomTitle.customTitle2)
                
                // TODO: 자막화면과 크기 맞추기
                Spacer()
            }
            .padding()
        }
        .background(.brandPrimary)
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
}
