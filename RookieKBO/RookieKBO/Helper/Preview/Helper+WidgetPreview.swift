//
//  Helper+WidgetPreview.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import Foundation

// MARK: - Preview를 위한 주입용 Mock 객체 (위젯 적용 가능)

//#if DEBUG
enum PreviewHelperForWidget {
    
    static let mockMatchUseCase = MatchUseCase(
        matchService: MatchServiceImpl()
    )
}
//#endif
