//
//  Helper+Preview.swift
//  RookieKBO
//
//  Created by crownjoe on 11/7/24.
//

import Foundation

// MARK: - Preview를 위한 주입용 Mock 객체 (위젯 적용 불가능)

//#if DEBUG
@MainActor
enum PreviewHelper {
    
    static let mockSelectTeamUseCase = SelectTeamUseCase(
        selectTeamService: SelectTeamServiceImpl())
}
//#endif
