//
//  SavedTermsView.swift
//  RookieKBO
//
//  Created by crownjoe on 11/12/24.
//

import SwiftUI

struct SavedTermsView: View {
    @Environment(TermUseCase.self) private var termUseCase
    @Environment(PathModel.self) private var pathModel
    
    @State private var savedTermEntry: [TermEntry] = []
    @State private var isSaved: Bool = false
    
    var backButton: some View {
        Group {
            Button {
                pathModel.pop()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .frame(width: 36, height: 44)
            }
            
            Spacer()
            
            Text("저장된 야구 용어")
                .font(.Head.head5)
                .foregroundColor(.gray7)
            
            Spacer()
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(savedTermEntry, id: \.term) { termEntry in
                    let isTermSaved = termUseCase.isTermSaved(term: termEntry.term)
                    
                    SavedTermView(
                        isSaved: Binding(
                            get: { isTermSaved },
                            set: { newValue in
                                if newValue {
                                    termUseCase.createTermEntry(term: termEntry.term)
                                } else {
                                    termUseCase.deleteTermEntry(term: termEntry.term)
                                }
                                self.savedTermEntry = termUseCase.state.savedTerms
                                termUseCase.printTermEntries()
                            }
                        ),
                        term: termEntry.term,
                        description: termEntry.definition
                    )
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                }
            }
        }
        .onAppear {
            self.savedTermEntry = termUseCase.state.savedTerms
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

#Preview {
    SavedTermsView()
        .environment(PreviewHelper.mockTermUseCase)
        .environment(PathModel())
}
