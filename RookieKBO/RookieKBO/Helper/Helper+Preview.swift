//
//  Helper+Preview.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

// MARK: - Preview를 위한 주입용 Mock 객체

#if DEBUG
enum PreviewHelper {
    static let mockMatchUseCase = MatchUseCase(
        matchService: MatchServiceImpl()
    )
    
    static let mockSelectTeamUseCase = SelectTeamUseCase(
        selectTeamService: StubSelectTeamService())
}
#endif
