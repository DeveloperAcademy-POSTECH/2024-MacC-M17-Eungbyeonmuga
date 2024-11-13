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
    
    var body: some View {
        ZStack {
            Color.gray2
                .ignoresSafeArea(.all)
            
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
                .padding(.top, 24)
            }
            .onAppear {
                self.savedTermEntry = termUseCase.state.savedTerms
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


#Preview {
    SavedTermsView()
        .environment(PreviewHelper.mockTermUseCase)
        .environment(PathModel())
}
