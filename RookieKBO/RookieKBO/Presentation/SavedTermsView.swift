//
//  SavedTermsView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/12/24.
//

import SwiftUI
import SwiftData


struct SavedTermsView: View {
    @Environment(TermUseCase.self) private var termUseCase
    @Environment(PathModel.self) private var pathModel
    
    @State private var isSaved: Bool = false
    
    @Query var savedTermEntry: [TermEntry]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            Color.gray2
                .ignoresSafeArea(.all)
            
            if termUseCase.state.savedTerms.isEmpty {
                NoSavedTermsView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Button {
                        pathModel.pop()
                    } label : {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.gray7)
                    })
                    .navigationBarTitle("저장된 야구 용어", displayMode: .inline)
            }
            else {
                ScrollView {
                    VStack {
                        ForEach(savedTermEntry, id: \.term) { termEntry in
                            let isTermSaved = isTermSaved(term: termEntry.term)
                            
                            SavedTermView(
                                isSaved: Binding(
                                    get: { isTermSaved },
                                    set: { newValue in
                                        if newValue {
                                            termUseCase.createTermEntry(term: termEntry.term)
                                        } else {
                                            deleteTermEntry(term: termEntry.term)
                                        }
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
                .onAppear {
                    print("👍👍👍👍", savedTermEntry)
                }
                .onChange(of: savedTermEntry) {
                    print("👍👍👍👍", savedTermEntry)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button {
                    pathModel.pop()
                } label : {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray7)
                })
                .navigationBarTitle("저장된 야구 용어", displayMode: .inline)
                .background(Color.gray2)
            }
        }
    }
    
    private func isTermSaved(term: String) -> Bool {
        return savedTermEntry.contains { $0.term == term }
    }
    
    private func deleteTermEntry(term: String) {
        do {
            if let termToDelete = savedTermEntry.first(where: { $0.term == term }) {
                modelContext.delete(termToDelete)
                print("✅ \(term) 용어가 삭제됨")
            } else {
                print("❌ 삭제할 용어를 찾을 수 없음")
            }
        } catch {
            print("❌ TermEntry 삭제 중 오류 발생: \(error)")
        }
    }
}

private struct NoSavedTermsView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            
            Image(.allTeamUnder)
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
    }
    
}


#Preview {
    SavedTermsView()
        .environment(PreviewHelper.mockTermUseCase)
        .environment(PathModel())
}
