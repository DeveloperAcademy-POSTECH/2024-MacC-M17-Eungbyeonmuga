//
//  SavedTermsView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/12/24.
//

import SwiftUI
import SwiftData

struct SavedTermsView: View {
    @Environment(PathModel.self) private var pathModel
    @Environment(\.modelContext) var modelContext
    
    @State private var isSaved: Bool = false
    @State private var isShowToastMessage: Bool = false
    @State private var toastMessage: String = ""
    
    @Query var savedTermEntry: [TermEntry]
    
    var body: some View {
        ZStack {
            if savedTermEntry.isEmpty {
                NoSavedTermsView()
            }
            else {
                ScrollView {
                    VStack {
                        ForEach(savedTermEntry, id: \.term) { termEntry in
                            let isTermSaved = isTermSaved(term: termEntry.term)
                            
                            SavedTermRow(
                                isSaved: Binding(
                                    get: { isTermSaved },
                                    set: { _ in
                                        deleteTermEntry(term: termEntry.term)
                                    }
                                ),
                                term: termEntry.term,
                                description: termEntry.definition
                            )
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)
                        }
                    }
                    .padding(.top, 24)
                }
            }
            
            VStack {
                Spacer()
                
                ToastMessage(
                    message: toastMessage,
                    isToastPresented: $isShowToastMessage
                )
                .padding(.bottom, 35)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button {
            pathModel.pop()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.gray7)
        })
        .navigationBarTitle("저장된 야구 용어", displayMode: .inline)
        .background(.gray2)
        
    }
    
    private func isTermSaved(term: String) -> Bool {
        return savedTermEntry.contains { $0.term == term }
    }
    
    private func deleteTermEntry(term: String) {
        if let termToDelete = savedTermEntry.first(where: { $0.term == term }) {
            modelContext.delete(termToDelete)
            isShowToastMessage = true
            toastMessage = "'\(term)' 삭제되었어요."
            print("✅ \(term) 용어가 삭제")
        } else {
            print("❌ 삭제할 용어를 찾을 수 없음")
        }
    }
}

private struct NoSavedTermsView: View {
    
    @Environment(SelectTeamUseCase.self) private var selectTeamUseCase
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            
            Image(selectTeamUseCase.state.selectedTeam?.image ?? "allTeamUnder")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                .padding(.bottom, 16)
            
            Text("저장되어 있는")
                .font(.Head.head5)
                .foregroundColor(.gray6)
                .padding(.bottom, 8)
            
            Text("용어가 없어요!")
                .font(.Head.head5)
                .foregroundColor(.gray6)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SavedTermsView()
        .environment(PathModel())
}
